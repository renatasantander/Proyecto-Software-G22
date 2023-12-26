class ChatsController < ApplicationController
  before_action :authenticate_user!

  def index
    if current_user.empleado || current_user.admin?
      @chats = Chat.where(is_private: true).joins(:users).where(users: { id: current_user.id })
    else
      @chats = current_user.reservas.includes(:chat).map(&:chat)
    end

    # @chats = Chat.public_chats
      @users = User.all_except(current_user)
      @chat = Chat.new
  end
    
  def create
    @chat = Chat.new(chat_params)
      if @chat.save
        redirect_to chat_path(@chat)
      else
        render :new, status: :unprocessable_entity 
      end
  end

  def show
    @single_chat = Chat.find(params[:id])
      # @chats = Chat.public_chats
      @chats = Chat.where(is_private: true).joins(:users).where(users: { id: current_user.id })
      @users = User.all_except(current_user)
      @chat = Chat.new
      @mensaje = Mensaje.new
      @mensajes = @single_chat.mensajes.order(created_at: :asc)

      render "index"
  end

  def destroy
    @chat = Chat.find(params[:id])
      @chat.destroy

      redirect_to chats_path
  end

    private
  def chat_params
    params.require(:chat).permit(:name)
  end

end
