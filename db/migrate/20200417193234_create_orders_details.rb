class CreateOrdersDetails < ActiveRecord::Migration[6.0]
  
  def change
    create_table :orders_details do |t|
      t.integer :order_id
      t.string :order_item
      t.integer :item_price
      t.integer :item_quantity
      t.integer :user_id

      t.timestamps
    end
  end
end
