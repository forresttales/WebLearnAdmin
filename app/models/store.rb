# == Schema Information
#
# Table name: stores
#
#  id           :integer          not null, primary key
#  created_at   :datetime
#  updated_at   :datetime
#  name_type    :string(100)
#  salutation   :string(100)
#  name_first   :string(100)
#  name_last    :string(100)
#  name_title   :string(100)
#  institute    :string(300)
#  department   :string(300)
#  address_1    :string(300)
#  address_2    :string(300)
#  city         :string(100)
#  state        :string(100)
#  zip          :string(100)
#  country      :string(100)
#  phone        :string(200)
#  fax          :string(200)
#  phone_direct :string(200)
#  phone_mobile :string(200)
#  email        :string(300)
#  website      :string(300)
#

class Store < ActiveRecord::Base
  
  attr_accessible :id,
                  :created_at, 
                  :updated_at,
                  :name_type,
                  :salutation,
                  :name_first,
                  :name_last,
                  :name_title,
                  :institute,
                  :department,
                  :address_1,
                  :address_2,
                  :city,
                  :state,
                  :zip,
                  :country,
                  :phone,
                  :fax,
                  :phone_direct,
                  :phone_mobile,
                  :email,
                  :website
                  

  def self.dbdelete
      self.connection.execute("DELETE FROM stores")
  end
  
  def self.dbclear
      self.connection.execute("ALTER SEQUENCE stores_id_seq RESTART WITH 1")
  end
  
  # def self.to_csv(options = {})
    # CSV.generate(options) do |csv|
      # csv << column_names
      # all.each do |store|
         # csv << store.attributes.values_at(*column_names)
      # end
    # end
  # end
  
  def self.import(file)
    
    
    
    
    
    
    
    
    
    
      # self.connection.execute("ALTER SEQUENCE stores_id_seq RESTART WITH 1")
    
    # if self.last.nil?                                                     # added
      # self.connection.execute("ALTER SEQUENCE stores_id_seq RESTART WITH 1")
      # id_new = 1                                                          # added
    # else                                                                  # added
      # idlast = self.last                                                  # added
      # id_last = idlast.id                                                 # added
      # id_new = id_last + 1                                                # added      
    # end                                                                   # added
    
    # id_new = self.maximum(:id).next
    
    
    # spreadsheet = open_spreadsheet(file)
    # header = spreadsheet.row(1)
    # (2..spreadsheet.last_row).each do |i|
      # row = Hash[[header, spreadsheet.row(i)].transpose]
      # store = find_by_id(row["id"]) || new
      # store.attributes = row.to_hash.slice(*accessible_attributes)
      # # store.id = id_new                                                   # added
      # # id_new += 1                                                         # added      
      # store.save!
    # end
  end

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
    when ".csv" then Roo::Csv.new(file.path)
    #when ".xls" then Roo::Excel.new(file.path, nil, :ignore)
    when ".xls" then Roo::Excel.new(file.path)
    when ".xlsx" then Roo::Excelx.new(file.path, nil, :ignore)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end

  
  def self.search_by_sql(s)
      where(s)
  end

  
end
