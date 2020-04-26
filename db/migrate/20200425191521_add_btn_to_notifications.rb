class AddBtnToNotifications < ActiveRecord::Migration[6.0]
  def change
    add_column :notifications, :btn, :string
  end
end
