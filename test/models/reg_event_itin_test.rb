# == Schema Information
#
# Table name: reg_event_itins
#
#  id              :integer          not null, primary key
#  city_state      :string(50)
#  date_event      :date
#  address         :text
#  created_at      :datetime
#  updated_at      :datetime
#  date_event_text :string(50)
#  order_display   :integer          default(0)
#

require 'test_helper'

class RegEventItinTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
