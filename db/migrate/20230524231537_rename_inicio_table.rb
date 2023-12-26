class RenameInicioTable < ActiveRecord::Migration[7.0]
  def change
    rename_table :inicio, :inicios
  end
end
