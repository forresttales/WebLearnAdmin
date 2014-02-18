# == Schema Information
#
# Table name: share_files
#
#  id              :integer          not null, primary key
#  name_originator :string(50)
#  name_file       :string(50)
#  created_at      :datetime
#  updated_at      :datetime
#

class ShareFile < ActiveRecord::Base
  
  attr_accessible :id, :name_originator, :name_file, :created_at, :updated_at
  
end
