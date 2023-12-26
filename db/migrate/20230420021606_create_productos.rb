class CreateProductos < ActiveRecord::Migration[7.0]
  def change
    create_table :productos do |t|
      t.text :nombre
      t.integer :precio
      t.text :imagen
      t.integer :disponibilidad
      t.text :descripcion

      t.timestamps
    end
  end
end
