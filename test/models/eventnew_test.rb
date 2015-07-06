# == Schema Information
#
# Table name: eventnews
#
#  id           :integer          not null, primary key
#  article_id   :integer
#  name_url     :string(100)
#  name_file    :string(50)
#  name_author  :string(50)
#  name_admin   :string(50)
#  key_words    :text
#  date_article :date
#  article_type :string(20)
#  description  :string(200)
#  linkimg      :string(50)
#  linkimg_url  :string(100)
#  linktitle    :string(200)
#  slug         :string(200)
#  created_at   :datetime
#  updated_at   :datetime
#

require 'test_helper'

class EventnewTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
