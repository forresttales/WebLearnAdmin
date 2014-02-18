class AlterStores2 < ActiveRecord::Migration
  def change

    remove_column("stores", "state_providence")    
    remove_column("stores", "email_website")    
    
    add_column :stores, :email, :string, :limit => 100    
    add_column :stores, :website, :string, :limit => 100    
    add_column :stores, :state, :string, :limit => 100    

    
  end
end
