# == Schema Information
#
# Table name: images
#
#  id            :integer          not null, primary key
#  admin_user_id :integer
#  image_name    :string(100)
#  created_at    :datetime
#  updated_at    :datetime
#

class Image < ActiveRecord::Base
  
  attr_accessible :id,
                  :admin_user_id,
                  :image_name,
                  :created_at,
                  :updated_at 
  
  
  belongs_to :admin_user
  
end
