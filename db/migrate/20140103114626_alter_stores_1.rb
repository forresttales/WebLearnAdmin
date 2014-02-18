class AlterStores1 < ActiveRecord::Migration
  def change
    
    add_column :stores, :name_first, :string, :limit => 50    
    add_column :stores, :name_last, :string, :limit => 50    
    add_column :stores, :name_title, :string, :limit => 50    
    add_column :stores, :institute, :string, :limit => 100    
    add_column :stores, :department, :string, :limit => 100    
    add_column :stores, :address_1, :string, :limit => 100    
    add_column :stores, :address_2, :string, :limit => 100    
    add_column :stores, :city, :string, :limit => 50    
    add_column :stores, :state_providence, :string, :limit => 50    
    add_column :stores, :zip, :string, :limit => 50    
    add_column :stores, :country, :string, :limit => 100    
    add_column :stores, :phone, :string, :limit => 50    
    add_column :stores, :fax, :string, :limit => 50    
    add_column :stores, :phone_direct, :string, :limit => 50    
    add_column :stores, :phone_mobile, :string, :limit => 50    
    add_column :stores, :email_website, :string, :limit => 100    
    
  end
end


    # name_first                  First Name  
    # name_last                   Last Name  
    # name_title                  Title
    # institute                   INSTITUTE
    # department                  Department 
    # address_1                   Mailing Address Line 1 
    # address_2                   Mailing Address Line 2 
    # city                        Mailing City 
    # state_providence            Mailing State/Provence
    # zip                         Mailing Zip/Postal Code
    # country                     Mailing Country
    # phone                       Main Phone
    # fax                         Fax
    # phone_direct                Phone Direct 
    # phone_mobile                Mobile Phone  
    # email_website               Email Website
