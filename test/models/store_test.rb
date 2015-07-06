# == Schema Information
#
# Table name: stores
#
#  id           :integer          not null, primary key
#  created_at   :datetime
#  updated_at   :datetime
#  name_type    :string(100)
#  salutation   :string(100)
#  name_first   :string(100)
#  name_last    :string(100)
#  name_title   :string(100)
#  institute    :string(300)
#  department   :string(300)
#  address_1    :string(300)
#  address_2    :string(300)
#  city         :string(100)
#  state        :string(100)
#  zip          :string(100)
#  country      :string(100)
#  phone        :string(200)
#  fax          :string(200)
#  phone_direct :string(200)
#  phone_mobile :string(200)
#  email        :string(300)
#  website      :string(300)
#

require 'test_helper'

class StoreTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
