# == Schema Information
#
# Table name: reg_event_conferences
#
#  id               :integer          not null, primary key
#  name_first       :string(255)      default(""), not null
#  name_last        :string(255)      default(""), not null
#  name_title       :string(255)      default(""), not null
#  position_title   :string(255)      default(""), not null
#  type_affiliation :string(255)      default(""), not null
#  name_affiliation :string(255)      default(""), not null
#  address          :string(255)      default(""), not null
#  city             :string(255)      default(""), not null
#  state            :string(255)      default(""), not null
#  zip              :string(255)      default(""), not null
#  phone            :string(255)      default(""), not null
#  phone_mobile     :string(255)      default(""), not null
#  email            :string(255)      default(""), not null
#  topic            :string(255)      default(""), not null
#  description      :text             default(""), not null
#  created_at       :datetime
#  updated_at       :datetime
#

require 'test_helper'

class AdminRegEventConferenceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
