class CarritosController < ApplicationController
  def index
    @render_carrito = false
    @carrito = Carrito.find_by(user_id: current_user.id)
  end

  def agregar
    @carrito = Carrito.find_by(user_id: current_user.id)
    @producto = Producto.find_by(id: params[:id])
    cantidad = params[:cantidad].to_i
    current_carrito_productos = @carrito.carrito_productos.find_by(producto_id: @producto.id)
    if current_carrito_productos && cantidad > 0
      current_carrito_productos.update(cantidad:)
    elsif cantidad <= 0
      current_carrito_productos.destroy
    else
      @carrito.carrito_productos.create(producto: @producto, cantidad:)
    end
    redirect_to user_carritos_path(current_user.id)
  end

  def update
    @carrito = Carrito.find_by(id: params[:id])
    @producto = Producto.find_by(id: params[:producto_id])
    current_carrito_productos = @carrito.carrito_productos.find_by(producto_id: @producto.id)
    if current_carrito_productos.update(carrito_productos_params)
      redirect_to user_carritos_path(current_user.id)
    end
  end

  def remove
    CarritoProducto.find_by(id: params[:id]).destroy
    redirect_to user_carritos_path(current_user.id)
    # @producto = Producto.find_by(id: params[:producto_id])
    # @carrito.carrito_productos.find_by(producto_id: @producto.id).destroy
  end

  def reservar
    @carrito = Carrito.find_by(id: params[:id])
    carritos_productos = CarritoProducto.where(carrito_id: @carrito.id)
    carritos_productos.each do |carrito_producto|
      @producto = Producto.find_by(id: carrito_producto.producto_id)
      @cantidad_productos = carrito_producto.cantidad
      @reserva = Reserva.new(cantidad_productos: @cantidad_productos, descripcion: "Reservado a través de carrito de Compras")
      @reserva.user_id = current_user.id
      @reserva.producto = @producto  
      @reserva.estado = "Pendiente"
      @reserva.save
      carrito_producto.destroy
    end
    redirect_to user_reservas_path(current_user)
  end


  private
        
  def carrito_productos_params
    params.require(:carrito_producto).permit(:cantidad)
  end
end
