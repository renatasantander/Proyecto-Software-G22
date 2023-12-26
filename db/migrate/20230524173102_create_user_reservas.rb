class CreateUserReservas < ActiveRecord::Migration[7.0]
  def change
    create_table :user_reservas do |t|
      t.references :user, null: false, foreign_key: true
      t.references :reserva, null: false, foreign_key: true

      t.timestamps
    end
  end
end
