class AddEmpleadoToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :empleado, :boolean
  end
end
