class CreateUsersProjectsJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_join_table :projects, :users do |t|
      t.index :project_id
      t.index :user_id
    end
  end
end
