class ReservasController < ApplicationController
  before_action :authenticate_user!

  def new
    @producto = Producto.find(params[:producto_id])
      #@reserva = @user.reservas.new 
  end

    #POST
  def create
    @producto = Producto.find(params[:producto_id])
      @reserva = Reserva.new(reserva_params)
      @reserva.user_id = current_user.id
      @reserva.producto = @producto  
      @reserva.estado = "Pendiente"

      if @reserva.save
        redirect_to user_reservas_path(current_user)
      else
        render :new, status: :unprocessable_entity 
      end
  end

    #GET 
  def index
    if current_user.empleado || current_user.admin?
      @reservas = Reserva.all
    else
      @reservas = current_user.reservas
    end
  end

    #GET/reserva/id
  def show
    if current_user.empleado || current_user.admin?
      @reserva = Reserva.find_by(id:params[:id])
    else
      @reserva = current_user.reservas.find(params[:id])
    end
  end

  def edit
    @producto = Producto.find(params[:producto_id])
      @reserva = @producto.reservas.find(params[:id])
  end

    #PATCH
  def update
    @producto = Producto.find(params[:producto_id])
      @reserva = @producto.reservas.find(params[:id])
      if @reserva.update(reserva_params)
        if @reserva.estado == "Aceptada" && @reserva.chat.nil?
          empleados_ids = User.where(empleado: true).pluck(:id)
          empleados_ids << User.where(admin: true).pluck(:id)
          participantes_ids = empleados_ids << @reserva.user_id
          @chat = Chat.create(name: "Chat de Reserva ##{@reserva.id}", is_private: true)
          @chat.users << User.find(participantes_ids)
          @reserva.update(chat: @chat)
        end
        redirect_to user_reserva_path(current_user)
      else
        render :edit, status: :unprocessable_entity
      end
  end

    #DELETE/reserva/id
  def destroy
    # @reserva = current_user.reservas.find(params[:id])
    
    if current_user.empleado || current_user.admin?
      @reserva = Reserva.find_by(id:params[:id])
    else
      @reserva = current_user.reservas.find(params[:id])
    end
    @reserva.destroy

    redirect_to user_reservas_path(current_user), status: :see_other
  end

  private
        
  def reserva_params
    params.require(:reserva).permit(:cantidad_productos, :descripcion, :estado)
  end
end
