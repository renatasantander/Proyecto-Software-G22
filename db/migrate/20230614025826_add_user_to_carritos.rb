class AddUserToCarritos < ActiveRecord::Migration[7.0]
  def change
    add_reference :carritos, :user, null: false, foreign_key: true
  end
end
