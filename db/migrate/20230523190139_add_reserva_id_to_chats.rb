class AddReservaIdToChats < ActiveRecord::Migration[7.0]
  def change
    add_reference :chats, :reserva, null: false, foreign_key: true
  end
end
