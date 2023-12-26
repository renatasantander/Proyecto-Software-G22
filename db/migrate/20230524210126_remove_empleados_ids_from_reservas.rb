class RemoveEmpleadosIdsFromReservas < ActiveRecord::Migration[7.0]
  def change
    remove_column :reservas, :empleados_ids, :text
  end
end
