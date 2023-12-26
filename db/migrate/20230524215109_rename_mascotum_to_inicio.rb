class RenameMascotumToInicio < ActiveRecord::Migration[7.0]
  def change
    rename_table :mascota, :inicio
  end
end
