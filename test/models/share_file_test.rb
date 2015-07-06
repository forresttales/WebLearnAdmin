# == Schema Information
#
# Table name: share_files
#
#  id              :integer          not null, primary key
#  name_originator :string(50)
#  name_file       :string(50)
#  created_at      :datetime
#  updated_at      :datetime
#

require 'test_helper'

class ShareFileTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
