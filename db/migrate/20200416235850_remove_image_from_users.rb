class RemoveImageFromUsers < ActiveRecord::Migration[6.0]
  def change

    remove_column :users, :image, :file
  end
end
