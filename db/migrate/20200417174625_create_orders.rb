class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders, id: false do |t|
     
      t.integer :order_id , null:false
      t.integer :created_by
      t.date :Order_date
      t.string :restaurant

      t.timestamps
    end

    execute %Q{ ALTER TABLE "orders" ADD PRIMARY KEY ("order_id"); }
  end
end
