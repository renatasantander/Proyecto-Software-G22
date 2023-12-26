class Producto < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :reservas, dependent: :destroy
  has_many :carrito_productos, dependent: :destroy
  has_many :carritos, through: :carrito_productos
   
  validates :nombre, presence: true, uniqueness: true 
  validates :precio, presence: true, numericality: { only_integer: true }
  validates :disponibilidad, presence: true, numericality: { only_integer: true }
  validates :descripcion, presence: true

  has_one_attached :imagen

  # after_commit :add_default_imagen, on: %i[create update]
  after_commit :add_default_imagen, on: %i[create update] #, if: :not_seeds_rb?

  # def not_seeds_rb?
  #   !File.basename($0).starts_with?('rake')
  # end

  def calificacion_promedio
    reviews.average(:calificacion)
  end

  def imagen_thumbnail
    self.imagen.variant(resize_to_limit: [150, 150]).processed
  end

  private

  def add_default_imagen
    return if self.imagen.attached?
      
      self.imagen.attach(
        io: File.open(
          Rails.root.join(
            'app', 'assets', 'images', 'default_product_imagen.jpg'
          )
        ), filename: 'default_product_imagen.jpg',
        content_type: 'image/jpg'
      )
      save!
    end
end
