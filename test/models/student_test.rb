# == Schema Information
#
# Table name: students
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#  phone      :string(50)
#  user_id    :integer
#

require 'test_helper'

class StudentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
