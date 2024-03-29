class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.text :titulo
      t.float :calificacion
      t.text :contenido

      t.references :producto, null: false, foreign_key: true

      t.timestamps
    end
  end
end
