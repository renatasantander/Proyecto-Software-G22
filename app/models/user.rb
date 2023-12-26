class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # has_many :user_reservas, dependent: :destroy
  # has_many :reservas, through: :user_reservas
  # has_and_belongs_to_many :reservas, dependent: :destroy
  validates :name, presence: true
  validates :telefono, presence: true, numericality: { only_integer: true }
  scope :all_except, ->(user) { where.not(id: user) }
  # after_create_commit { broadcast_append_to "users" }
  has_many :mensajes
  has_many :reservas, dependent: :destroy
  has_one_attached :image
  has_many :reviews, dependent: :destroy
  has_one :carrito, dependent: :destroy

  after_commit :add_default_image, on: %i[create update]
  after_create :create_carrito

  def image_thumbnail
    self.image.variant(resize_to_limit: [150, 150]).processed
  end

  def chat_image
    self.image.variant(resize_to_limit: [50, 50]).processed
  end

  def create_carrito
    if not admin and not empleado?
      @carrito = Carrito.create(user_id: self.id)
    end
  end

  private

  def add_default_image
    return if self.image.attached?
      
      self.image.attach(
        io: File.open(
          Rails.root.join(
            'app', 'assets', 'images', 'default_user_image.png'
          )
        ), filename: 'default_user_image.png',
        content_type: 'image/png'
      )
      save!
    end
end
