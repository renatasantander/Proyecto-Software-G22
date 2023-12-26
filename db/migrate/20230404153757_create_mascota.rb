class CreateMascota < ActiveRecord::Migration[7.0]
  def change
    create_table :mascota do |t|
      t.text :name
      t.integer :stock

      t.timestamps
    end
  end
end
