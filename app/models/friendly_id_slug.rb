# == Schema Information
#
# Table name: friendly_id_slugs
#
#  id             :integer          not null, primary key
#  slug           :string(255)
#  sluggable_id   :integer
#  sluggable_type :string(50)
#  scope          :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#

class FriendlyIdSlug < ActiveRecord::Base
  
  attr_accessible :id, :slug, :sluggable_id, :sluggable_type, :scope, :created_at, :updated_at
  
  def self.search_id(search)
    if search
      where('id = ?', search)
    else
      scoped
    end
  end

  def self.search_sluggable_id(search)
    if search
      where('sluggable_id = ?', search)
    else
      scoped
    end
  end

  def self.search_slug(search)
    if search
      where('slug LIKE ?', "%#{search}%")
    else
      scoped
    end
  end
  
end
