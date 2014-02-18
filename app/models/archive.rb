# == Schema Information
#
# Table name: archives
#
#  id           :integer          not null, primary key
#  article_id   :integer
#  name_url     :string(100)
#  name_file    :string(50)
#  name_author  :string(50)
#  name_admin   :string(50)
#  key_words    :text
#  date_article :date
#  created_at   :datetime
#  updated_at   :datetime
#  article_type :string(20)
#  description  :string(200)
#  linkimg      :string(50)
#  linkimg_url  :string(100)
#  linktitle    :string(200)
#  slug         :string(200)
#

class Archive < ActiveRecord::Base
  
  attr_accessible :id, :article_id, :type, :name_url, :name_file, :name_author, :name_admin, :key_words, :date_article, :created_at, :updated_at, :description,
                  :linkimg, :linkimg_url, :linktitle, :slug

  extend FriendlyId
  friendly_id :name_file, use: [:slugged, :history]


  def self.search_id(search)
    if search
      where('id = ?', search)
    else
      scoped
    end
  end

  def self.search_article_id(search)
    if search
      where('article_id = ?', search)
    else
      scoped
    end
  end

  def self.search_name_file(search)
    if search
      where('name_file LIKE ?', "%#{search}%")
    else
      scoped
    end
  end

    
end
