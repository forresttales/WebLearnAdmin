class AlterStores4 < ActiveRecord::Migration
  def change
    remove_column("stores", "name_type")    
    remove_column("stores", "salutation")        
    remove_column("stores", "name_first")    
    remove_column("stores", "name_last")    
    remove_column("stores", "name_title")    
    remove_column("stores", "institute")    
    remove_column("stores", "department")    
    remove_column("stores", "address_1")    
    remove_column("stores", "address_2")    
    remove_column("stores", "city")
    remove_column("stores", "state")    
    remove_column("stores", "zip")    
    remove_column("stores", "country")    
    remove_column("stores", "phone")    
    remove_column("stores", "fax")    
    remove_column("stores", "phone_direct")    
    remove_column("stores", "phone_mobile")    
    remove_column("stores", "email")    
    remove_column("stores", "website")    
    
    add_column :stores, :name_type, :string, :limit => 100    
    add_column :stores, :salutation, :string, :limit => 100    
    add_column :stores, :name_first, :string, :limit => 100    
    add_column :stores, :name_last, :string, :limit => 100    
    add_column :stores, :name_title, :string, :limit => 100    
    add_column :stores, :institute, :string, :limit => 300    
    add_column :stores, :department, :string, :limit => 300    
    add_column :stores, :address_1, :string, :limit => 300    
    add_column :stores, :address_2, :string, :limit => 300    
    add_column :stores, :city, :string, :limit => 100    
    add_column :stores, :state, :string, :limit => 100    
    add_column :stores, :zip, :string, :limit => 100    
    add_column :stores, :country, :string, :limit => 100    
    add_column :stores, :phone, :string, :limit => 200    
    add_column :stores, :fax, :string, :limit => 200    
    add_column :stores, :phone_direct, :string, :limit => 200    
    add_column :stores, :phone_mobile, :string, :limit => 200    
    add_column :stores, :email, :string, :limit => 300    
    add_column :stores, :website, :string, :limit => 300    
    
  end
end

#  name_first   :string(50)
#  name_last    :string(50)
#  name_title   :string(50)
#  institute    :string(100)
#  department   :string(100)
#  address_1    :string(100)
#  address_2    :string(100)
#  city         :string(50)
#  zip          :string(50)
#  country      :string(100)
#  phone        :string(50)
#  fax          :string(50)
#  phone_direct :string(50)
#  phone_mobile :string(50)
#  email        :string(100)
#  website      :string(100)
#  state        :string(100)
#  name_type    :string(50)
#  salutation   :string(50)
