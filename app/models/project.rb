# == Schema Information
#
# Table name: projects
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Project < ApplicationRecord
  has_many :users_projects
  has_many :users, through: :users_projects, dependent: :destroy
  has_many :locatables, as: :locatable, dependent: :destroy
end
