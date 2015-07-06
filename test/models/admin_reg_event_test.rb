# == Schema Information
#
# Table name: reg_events
#
#  id                            :integer          not null, primary key
#  name_first                    :string(100)
#  name_last                     :string(100)
#  name_title                    :string(200)
#  type_affiliation              :string(200)
#  name_affiliation              :string(200)
#  address                       :string(200)
#  city                          :string(100)
#  state                         :string(50)
#  zip                           :string(50)
#  phone                         :string(50)
#  email                         :string(255)      default(""), not null
#  city_workshop                 :string(50)
#  created_at                    :datetime
#  updated_at                    :datetime
#  email_cc_1                    :string(100)
#  email_cc_2                    :string(100)
#  city_workshop_1               :boolean          default(FALSE)
#  city_workshop_2               :boolean          default(FALSE)
#  city_workshop_3               :boolean          default(FALSE)
#  city_workshop_4               :boolean          default(FALSE)
#  city_workshop_5               :boolean          default(FALSE)
#  city_workshop_6               :boolean          default(FALSE)
#  city_workshop_7               :boolean          default(FALSE)
#  city_workshop_8               :boolean          default(FALSE)
#  city_workshop_9               :boolean          default(FALSE)
#  city_workshop_10              :boolean          default(FALSE)
#  city_workshop_11              :boolean          default(FALSE)
#  city_workshop_12              :boolean          default(FALSE)
#  city_workshop_13              :boolean          default(FALSE)
#  city_workshop_1_text          :string(100)
#  city_workshop_2_text          :string(100)
#  city_workshop_3_text          :string(100)
#  city_workshop_4_text          :string(100)
#  city_workshop_5_text          :string(100)
#  city_workshop_6_text          :string(100)
#  city_workshop_7_text          :string(100)
#  city_workshop_8_text          :string(100)
#  city_workshop_9_text          :string(100)
#  city_workshop_10_text         :string(100)
#  city_workshop_11_text         :string(100)
#  city_workshop_12_text         :string(100)
#  city_workshop_13_text         :string(100)
#  city_workshop_14              :boolean          default(FALSE)
#  city_workshop_14_text         :string(100)
#  city_workshop_15              :boolean          default(FALSE)
#  city_workshop_15_text         :string(100)
#  city_workshop_1_session       :integer
#  city_workshop_2_session       :integer
#  city_workshop_3_session       :integer
#  city_workshop_4_session       :integer
#  city_workshop_5_session       :integer
#  city_workshop_6_session       :integer
#  city_workshop_7_session       :integer
#  city_workshop_8_session       :integer
#  city_workshop_9_session       :integer
#  city_workshop_10_session      :integer
#  city_workshop_11_session      :integer
#  city_workshop_12_session      :integer
#  city_workshop_13_session      :integer
#  city_workshop_14_session      :integer
#  city_workshop_1_session_text  :string(50)
#  city_workshop_2_session_text  :string(50)
#  city_workshop_3_session_text  :string(50)
#  city_workshop_4_session_text  :string(50)
#  city_workshop_5_session_text  :string(50)
#  city_workshop_6_session_text  :string(50)
#  city_workshop_7_session_text  :string(50)
#  city_workshop_8_session_text  :string(50)
#  city_workshop_9_session_text  :string(50)
#  city_workshop_10_session_text :string(50)
#  city_workshop_11_session_text :string(50)
#  city_workshop_12_session_text :string(50)
#  city_workshop_13_session_text :string(50)
#  city_workshop_14_session_text :string(50)
#  phone_mobile                  :string(100)
#  name_title_sir                :string(100)
#  city_workshop_16              :boolean          default(FALSE)
#  city_workshop_16_text         :string(100)
#  city_workshop_17              :boolean          default(FALSE)
#  city_workshop_17_text         :string(100)
#  city_workshop_18              :boolean          default(FALSE)
#  city_workshop_18_text         :string(100)
#  city_workshop_19              :boolean          default(FALSE)
#  city_workshop_19_text         :string(100)
#  city_workshop_20              :boolean          default(FALSE)
#  city_workshop_20_text         :string(100)
#  city_workshop_21              :boolean          default(FALSE)
#  city_workshop_21_text         :string(100)
#  city_workshop_22              :boolean          default(FALSE)
#  city_workshop_22_text         :string(100)
#  city_workshop_23              :boolean          default(FALSE)
#  city_workshop_23_text         :string(100)
#  city_workshop_24              :boolean          default(FALSE)
#  city_workshop_24_text         :string(100)
#  city_workshop_25              :boolean          default(FALSE)
#  city_workshop_25_text         :string(100)
#

require 'test_helper'

class AdminRegEventTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
