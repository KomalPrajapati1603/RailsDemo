# == Schema Information
#
# Table name: users_projects
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  project_id :integer
#  role_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class UsersProject < ApplicationRecord
  belongs_to :user
  belongs_to :project
  belongs_to :role
end
