class ChangeOwnerToBeIntegerInOrders < ActiveRecord::Migration[6.0]
  def change
    change_column :orders, :owner, :integer
  end
end
