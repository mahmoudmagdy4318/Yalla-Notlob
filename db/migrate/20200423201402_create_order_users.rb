class CreateOrderUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :order_users do |t|
      t.references :user, null: false, foreign_key: true,on_delete: :cascade
      t.references :order, null: false, foreign_key: true,on_delete: :cascade
      t.boolean :joined

      t.timestamps
    end
  end
end
