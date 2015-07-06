# == Schema Information
#
# Table name: admin_users
#
#  id                     :integer          not null, primary key
#  email                  :string(100)      default(""), not null
#  hashed_password        :string(40)
#  created_at             :datetime
#  updated_at             :datetime
#  username               :string(25)
#  salt                   :string(40)
#  name_first             :string(50)
#  name_last              :string(50)
#  password_digest        :string(255)
#  remember_token         :string(255)
#  admin                  :boolean          default(FALSE)
#  super_admin            :boolean          default(FALSE)
#  auth_token             :string(255)
#  password_reset_token   :string(255)
#  password_reset_sent_at :datetime
#

require 'test_helper'

class AdminUserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
