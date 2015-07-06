# == Schema Information
#
# Table name: contacts
#
#  id         :integer          not null, primary key
#  name       :string(255)      default("")
#  email      :string(255)      default(""), not null
#  subject    :string(255)      default("")
#  message    :text
#  created_at :datetime
#  updated_at :datetime
#  phone      :string(255)      default("")
#

class UserContact < Contact
  
end
