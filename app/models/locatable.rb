# == Schema Information
#
# Table name: locatables
#
#  id             :integer          not null, primary key
#  location_id    :integer
#  locatable_type :string
#  locatable_id   :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Locatable < ApplicationRecord
  belongs_to :location
  belongs_to :locatable, polymorphic: true
end
