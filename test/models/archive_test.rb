# == Schema Information
#
# Table name: archives
#
#  id                  :integer          not null, primary key
#  article_id          :integer
#  name_url            :string(255)      default("journal")
#  name_file           :string(255)
#  name_author         :string(255)
#  name_admin          :string(255)
#  key_words           :text
#  date_article        :date
#  created_at          :datetime
#  updated_at          :datetime
#  article_type        :string(255)
#  description         :string(255)
#  linkimg             :string(255)
#  linkimg_url         :string(255)
#  linktitle           :string(255)
#  slug                :string(255)
#  subtitle_1          :string(255)
#  subtitle_2          :string(255)
#  img_height          :integer          default(200)
#  linkimg_carousel    :string
#  img_height_carousel :integer          default(300)
#  subtitle_1_carousel :string
#  subtitle_2_carousel :string
#

require 'test_helper'

class ArchiveTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
