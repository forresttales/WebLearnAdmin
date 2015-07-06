# == Schema Information
#
# Table name: admin_user_images
#
#  id            :integer          not null, primary key
#  admin_user_id :integer
#  image_name    :string(100)
#  created_at    :datetime
#  updated_at    :datetime
#  primary       :boolean          default(FALSE)
#

require 'test_helper'

class AdminUserImageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
