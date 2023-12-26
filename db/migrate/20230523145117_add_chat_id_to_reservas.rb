class AddChatIdToReservas < ActiveRecord::Migration[7.0]
  def change
    add_reference :reservas, :chat, null: true, foreign_key: true
  end
end
