# == Schema Information
#
# Table name: item_registers
#
#  id               :integer          not null, primary key
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  item_description :string           default("")
#  item_type        :integer          default(0)
#

class ItemRegister < ActiveRecord::Base
  
  attr_accessible :id,
                  :item_description,
                  :item_type
                  

                  
  def next
    ItemRegister.where("id > ?", self.id).first
  end
  
  def previous
    ItemRegister.where("id < ?", self.id).last
  end


  # def self.search_by_sql(s)
      # where(s)
  # end
  # def self.search_id(search)
    # if search
      # where('id = ?', search)
    # else
      # scoped
    # end
  # end
  # def self.search_article_id(search)
    # if search
      # where('article_id = ?', search)
    # else
      # scoped
    # end
  # end
  # def self.search_name_file(search)
    # if search
      # where('name_file LIKE ?', "%#{search}%")
    # else
      # scoped
    # end
  # end

  
end
