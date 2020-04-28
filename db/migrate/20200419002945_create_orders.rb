class CreateOrders < ActiveRecord::Migration[6.0]
    def change
      create_table :orders do |t|
        t.integer :owner
        t.string :restaurant
  
        t.timestamps
      end
    end
end