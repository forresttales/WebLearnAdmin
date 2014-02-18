# == Schema Information
#
# Table name: admin_users
#
#  id              :integer          not null, primary key
#  email           :string(100)      default(""), not null
#  hashed_password :string(300)
#  created_at      :datetime
#  updated_at      :datetime
#  username        :string(30)
#  salt            :string(300)
#  name_first      :string(50)
#  name_last       :string(50)
#  password_digest :string(255)
#  remember_token  :string(255)
#  image_id        :integer
#

class AdminUserProfile < AdminUser
  
end
