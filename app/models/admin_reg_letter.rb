# == Schema Information
#
# Table name: reg_letters
#
#  id               :integer          not null, primary key
#  email            :string(255)      default(""), not null
#  name_title       :string(50)
#  name_affiliation :string(100)
#  created_at       :datetime
#  updated_at       :datetime
#

class AdminRegLetter < RegLetter
  
end
