class ChangePrecioToIntegerInProductos < ActiveRecord::Migration[7.0]
  def change
    change_column :productos, :precio, :integer
  end
end
