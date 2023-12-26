# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  def index
    @users = User.all
  end

  def edit
    @user = User.find_by(id:params[:id])
  end

  def update
    @user = User.find_by(id:params[:id])
    if @user.update(user_params)
      redirect_to users_sessions_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # def create
  #   super do |user|
  #     initialize_carrito(user) if user.persisted?
  #   end
  # end


  # def destroy
  #   @user = User.find_by(id:params[:id])
  #     @user.destroy
  #     redirect_to :users, status: :see_other
  # end

  private

  # def initialize_carrito(user)
  #   carrito = Carrito.find_by(user_id: user.id)
  #   if carrito.nil?
  #     carrito = Carrito.create(user_id: user.id)
  #   else
  #     carrito.update(user_id: user.id)
  #   end
  #   session[:carrito_id] = carrito.id
  # end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :current_password, :name, :telefono, 
                                 :descripcion, :image)
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
