class Carrito < ApplicationRecord
  belongs_to :user 
  has_many :carrito_productos, dependent: :destroy
  has_many :producto, through: :carrito_productos

  def total
    carrito_productos.to_a.sum {|carrito_productos| carrito_productos.total}
  end
end
