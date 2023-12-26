class AddProductoToReservas < ActiveRecord::Migration[7.0]
  def change
    add_reference :reservas, :producto, null: false, foreign_key: true
  end
end
