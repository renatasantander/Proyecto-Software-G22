class ProductosController < ApplicationController

    #GET/articles/new
  def new
    @producto = Producto.new
  end

    #POST/articles
  def create
    @producto = Producto.new(producto_params)
      if @producto.save
        redirect_to @producto
      else
        render :new, status: :unprocessable_entity 
      end
  end

    #GET 
  def index
    @productos = Producto.all
  end

    #GET/producto/id
  def show
    @producto = Producto.find(params[:id])
  end

    #GET/productos/id/edit
  def edit
    @producto = Producto.find(params[:id])
  end

    #PATCH/prodcutos/id
  def update
    @producto = Producto.find(params[:id])
      if @producto.update(producto_params)
        redirect_to @producto
      else
        render :edit, status: :unprocessable_entity
      end
  end

    #DELETE/producto/id
  def destroy
    @producto = Producto.find(params[:id])
      @producto.destroy

      redirect_to :productos, status: :see_other
  end

    private
  def producto_params
    params.require(:producto).permit(:nombre, :precio, :imagen, :disponibilidad, :descripcion)
  end

end
