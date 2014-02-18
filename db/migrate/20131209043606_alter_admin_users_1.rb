class AlterAdminUsers1 < ActiveRecord::Migration
  def change
    
    remove_column("admin_users", "first_name")    
    remove_column("admin_users", "last_name")    
    
    add_column :admin_users, :name_first, :string, :limit => 50    
    add_column :admin_users, :name_last, :string, :limit => 50    

    add_column :admin_users, :password_digest, :string
    add_column :admin_users, :remember_token, :string

  end
end
