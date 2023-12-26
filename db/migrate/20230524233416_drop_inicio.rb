class DropInicio < ActiveRecord::Migration[7.0]
  def change
    drop_table :inicios
  end
end
