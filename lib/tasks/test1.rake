# task :store_load => :environment do
  # store_130 = Store.find_by_id(130)
  # puts "store record 130: #{store_130.name_first}"
# end

#  id           :integer          not null, primary key
#  created_at   :datetime
#  updated_at   :datetime
#  name_type    :string(50)
#  salutation   :string(50)
#  name_first   :string(50)
#  name_last    :string(50)
#  name_title   :string(50)
#  institute    :string(100)
#  department   :string(100)
#  address_1    :string(100)
#  address_2    :string(100)
#  city         :string(50)
#  state        :string(100)
#  zip          :string(50)
#  country      :string(100)
#  phone        :string(50)
#  fax          :string(50)
#  phone_direct :string(50)
#  phone_mobile :string(50)
#  email        :string(100)
#  website      :string(100)

namespace :store do
  desc "Import bar data"
  task import: :environment do
    require 'csv'
 
    headers = [
      "name_type",
      "salutation",
      "name_first",
      "name_last",
      "name_title",
      "institute",     
      "department",     
      "address_1",     
      "address_2",     
      "city",     
      "state",     
      "zip",     
      "country",     
      "phone",     
      "fax",     
      "phone_direct",     
      "phone_mobile",     
      "email",     
      "website"     
    ]
 
    ActiveRecord::Base.establish_connection
 
    #/home/clyde/Downloads/Admin/MailingListSpreadsheets/
    #CSV.foreach("#{path}/2Public-Sector-Educators-List-2-Autosaved-2.csv", {headers: :first_row}) do |row|
    #CSV.foreach("/home/clyde/Downloads/Admin/MailingListSpreadsheets/2Public-Sector-Educators-List-2-Autosaved-2.csv", {headers: :first_row}) do |row|
    CSV.foreach(Rails.root.join('public/data/mailblast-1.csv'), {headers: :first_row}) do |row|
      
      sql_keys = []
      sql_vals = []
 
      created_at = Time.now.strftime("%Y-%m-%d %H:%M:%S")
 
      headers.each_with_index do |key, idx|
        val = row[idx]
 
        sql_keys << key
        sql_vals << ActiveRecord::Base.connection.quote(val)
      end
 
      sql = "
        INSERT INTO stores (#{sql_keys.join(', ')}, created_at, updated_at)
        VALUES (#{sql_vals.join(', ')}, '#{created_at}', '#{created_at}')
      "
 
      res = ActiveRecord::Base.connection.execute(sql)
      # store_id = ActiveRecord::Base.connection.last_inserted_id(res)
 
      # do some cool stuff, like create records in other tables that reference bar_id
      # use ActiveRecord::Base.connection.execute(your_sql) in subsequent calls.
      # no need to close the connection, or reopen it before calling execute.     
    end
  end
end