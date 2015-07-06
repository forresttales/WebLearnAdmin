# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  created_at      :datetime
#  updated_at      :datetime
#  email           :string(50)       default("")
#  username        :string(50)
#  password_digest :string(255)
#  remember_token  :string(255)
#  account_type    :string(50)
#  has_account     :boolean          default(FALSE)
#  name_first      :string(50)
#  name_last       :string(50)
#  admin           :boolean          default(FALSE)
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
