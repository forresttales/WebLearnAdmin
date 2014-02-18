# == Schema Information
#
# Table name: admin_user_images
#
#  id            :integer          not null, primary key
#  admin_user_id :integer
#  image_name    :string(100)
#  created_at    :datetime
#  updated_at    :datetime
#  primary       :boolean          default(FALSE)
#

class AdminUserImage < ActiveRecord::Base
  
  attr_accessible :id,
                  :admin_user_id,
                  :image_name,
                  :created_at,
                  :updated_at 
  
  
  belongs_to :admin_user
  
end
