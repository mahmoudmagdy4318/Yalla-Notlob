class CreateInvitedUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :invited_users do |t|
      t.integer :order_id
      t.integer :user_id
      t.boolean :joined

      t.timestamps
    end
  end
end
