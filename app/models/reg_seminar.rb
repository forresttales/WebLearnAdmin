# == Schema Information
#
# Table name: reg_seminars
#
#  id               :integer          not null, primary key
#  name_first       :string(50)
#  name_last        :string(50)
#  name_title       :string(50)
#  type_affiliation :string(50)
#  name_affiliation :string(100)
#  address          :string(100)
#  city             :string(50)
#  state            :string(50)
#  zip              :string(10)
#  phone            :string(50)
#  email            :string(100)
#  email_cc_1       :string(100)
#  email_cc_2       :string(100)
#  string           :string(100)
#  created_at       :datetime
#  updated_at       :datetime
#  seminar_1        :boolean          default(FALSE)
#  seminar_1_text   :string(100)
#

class RegSeminar < ActiveRecord::Base
  
    attr_accessible :id, 
                    :name_first, 
                    :name_last, 
                    :name_title, 
                    :type_affiliation, 
                    :name_affiliation, 
                    :address, 
                    :city, 
                    :state, 
                    :zip, 
                    :phone, 
                    :email, 
                    :email_cc_1, 
                    :email_cc_2, 
                    :seminar_1, 
                    :seminar_1_text,
                    :created_at,
                    :updated_at



end
