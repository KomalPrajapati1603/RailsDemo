class AddRoleToUsersProjects < ActiveRecord::Migration[5.2]
  def change
    add_reference :users_projects, :role, foreign_key: true
  end
end
