class AddForeignKey < ActiveRecord::Migration[6.0]
  def change  
    add_foreign_key :order_users, :orders,on_delete: :cascade
  end
end
