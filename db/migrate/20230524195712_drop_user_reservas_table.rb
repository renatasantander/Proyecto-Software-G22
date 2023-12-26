class DropUserReservasTable < ActiveRecord::Migration[7.0]
  def change
    drop_table :user_reservas
  end
end
