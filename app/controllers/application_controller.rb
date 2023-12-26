class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token
  # before_action :set_render_carrito
  # before_action :initialize_carrito

  # Agrega el método after_sign_in_path_for aquí
  def after_sign_in_path_for(_resource)
    root_path
  end
  
  # Agrega el método after_sign_out_path_for aquí
  def after_sign_out_path_for(_resource)
    root_path
  end

  # def set_render_carrito
  #   @render_carrito = true
  # end

  # def initialize_carrito
  #   if user_signed_in?
  #     @carrito = current_user.carrito || current_user.create_carrito
  #   else
  #     @carrito = Carrito.find_by(id: session[:carrito_id])
  #     if @carrito.nil?
  #       @carrito = Carrito.create
  #       session[:carrito_id] = @carrito.id
  #     end
  #   end
  # end
end

  
