class ReviewsController < ApplicationController
  before_action :set_producto
  before_action :authenticate_user!

    #GET
  def index
    @reviews = @producto.reviews.all
  end

    #GET
  def show
    @review = @producto.reviews.find(params[:id])
    @user = @review.user
  end

    #GET
  def new
    @review = @producto.reviews.new
  end

  def create
    @review = current_user.reviews.new(review_params)
    @review.producto = @producto
    # @review = @producto.reviews.new(review_params)
      if @review.save
        redirect_to producto_review_path(@producto, @review) #@review
      else
        render :new, status: :unprocessable_entity
      end
  end

    #GET
  def edit
      #@user = User.find(params[:user_id])
    @review = @producto.reviews.find(params[:id])
  end

    #PATCH
  def update
    @review = @producto.reviews.find(params[:id])
      if @review.update(review_params)
          #Si se actualiza, redirigimos a review
        redirect_to producto_review_path(@producto, @review)
      else
        render :edit, status: :unprocessable_entity
      end
  end

    #DELETE
  def destroy
      #@user = User.find(params[:user_id])
    @review = @producto.reviews.find(params[:id])
      @review.destroy

      redirect_to producto_reviews_path(@producto), status: :see_other
  end

    private
    # Se debe encontrar el producto de las reseñas
  def set_producto
    @producto = Producto.find(params[:producto_id])
  end

  def review_params
    params.require(:review).permit(:titulo, :calificacion, :contenido)
  end

end
