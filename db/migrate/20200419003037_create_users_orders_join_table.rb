class CreateUsersOrdersJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_join_table :orders, :users do |t|
      t.index :order_id
      t.index :user_id
      t.boolean :joined , default: false
    end
  end
end
