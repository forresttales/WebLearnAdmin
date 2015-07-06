# == Schema Information
#
# Table name: friendly_id_slugs
#
#  id             :integer          not null, primary key
#  slug           :string(255)
#  sluggable_id   :integer
#  sluggable_type :string(50)
#  scope          :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#

require 'test_helper'

class FriendlyIdSlugTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
