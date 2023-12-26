class MensajesController < ApplicationController
    
  def create
    @mensaje = current_user.mensajes.create(contenido: mensajes_params[:contenido], chat_id: params[:chat_id])
    redirect_to chat_path(:chat_id)
  end
    
  def destroy
    @mensaje = Mensaje.find(params[:id])
      @mensaje.destroy

      redirect_to chats_path
  end
      private
    
  def mensajes_params
    params.require(:mensaje).permit(:contenido)
  end
end
