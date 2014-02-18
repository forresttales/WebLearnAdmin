# == Schema Information
#
# Table name: tab3lets
#
#  id         :integer          not null, primary key
#  col_1      :string(300)
#  col_2      :string(300)
#  col_3      :string(300)
#  col_4      :string(300)
#  col_5      :string(300)
#  col_6      :string(300)
#  col_7      :string(300)
#  col_8      :string(300)
#  col_9      :string(300)
#  col_10     :string(300)
#  col_11     :string(300)
#  col_12     :string(300)
#  col_13     :string(300)
#  col_14     :string(300)
#  col_15     :string(300)
#  col_16     :string(300)
#  col_17     :string(300)
#  col_18     :string(300)
#  col_19     :string(300)
#  col_20     :string(300)
#  col_21     :string(300)
#  col_22     :string(300)
#  col_23     :string(300)
#  col_24     :string(300)
#  col_25     :string(300)
#  created_at :datetime
#  updated_at :datetime
#

class Tab3let < ActiveRecord::Base
  
  attr_accessible :id,
                  :col_1,
                  :col_2,
                  :col_3,
                  :col_4,
                  :col_5,
                  :col_6,
                  :col_7,
                  :col_8,
                  :col_9,
                  :col_10,
                  :col_11,
                  :col_12,
                  :col_13,
                  :col_14,
                  :col_15,
                  :col_16,
                  :col_17,
                  :col_18,
                  :col_19,
                  :col_20,                  
                  :col_21,                  
                  :col_22,                  
                  :col_23,                  
                  :col_24,                  
                  :col_25,                  
                  :created_at,
                  :updated_at  


  def self.dbdelete
      self.connection.execute("DELETE FROM tab3lets")
  end

  
  def self.dbclear
      self.connection.execute("ALTER SEQUENCE tab3lets_id_seq RESTART WITH 1")
  end

  
  def self.import(file)
    
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
