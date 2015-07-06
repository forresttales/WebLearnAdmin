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
#  prof_title       :string(255)
#  name_first       :string(255)
#  name_last        :string(255)
#  address          :string(255)
#  city             :string(255)
#  state            :string(255)
#  zip              :string(255)
#  country          :string(255)
#  phone            :string(255)
#  pub_priv         :string(255)
#

class AdminRegLetter < RegLetter
  
end
