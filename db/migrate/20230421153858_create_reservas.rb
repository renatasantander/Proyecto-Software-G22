class CreateReservas < ActiveRecord::Migration[7.0]
  def change
    create_table :reservas do |t|
      t.text :cantidad_productos
      t.text :descripcion
      #t.date :fecha_reserva
      t.text :estado
      
      t.references :user, null: false, foreign_key: true
      #t.references :producto, null: false, foreign_key: true

      t.timestamps
    end
  end
end
