class CarritoProducto < ApplicationRecord
  belongs_to :producto
  belongs_to :carrito

  def total
    producto.precio * cantidad
  end
end
