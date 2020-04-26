class RemoveUserFromGroup < ActiveRecord::Migration[6.0]
  def change
    remove_reference :groups, :user, null: false, foreign_key: true
  end
end
