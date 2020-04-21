class CreateOrderDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :order_details do |t|
      t.references :order, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :item
      t.integer :amount
      t.integer :price
      t.text :comment

      t.timestamps
    end
  end
end
