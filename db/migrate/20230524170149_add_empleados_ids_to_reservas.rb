class AddEmpleadosIdsToReservas < ActiveRecord::Migration[7.0]
  def change
    add_column :reservas, :empleados_ids, :text
  end
end
