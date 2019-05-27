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

require 'test_helper'

class LocatableTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
