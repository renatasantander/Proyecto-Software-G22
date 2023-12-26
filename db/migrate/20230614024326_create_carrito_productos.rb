class CreateCarritoProductos < ActiveRecord::Migration[7.0]
  def change
    create_table :carrito_productos do |t|
      t.belongs_to :producto, null: false, foreign_key: true
      t.belongs_to :carrito, null: false, foreign_key: true
      t.integer :cantidad

      t.timestamps
    end
  end
end
