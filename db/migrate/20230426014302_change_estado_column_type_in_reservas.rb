class ChangeEstadoColumnTypeInReservas < ActiveRecord::Migration[7.0]
  def change
    change_column :reservas, :estado, :string
    change_column :reservas, :estado, :string, inclusion: { in: %w(Pendiente Aceptada Rechazada) }
  end
end
