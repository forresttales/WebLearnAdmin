class AlterAdminUserImages < ActiveRecord::Migration
  def change
    
    add_column :admin_user_images, :primary, :boolean, :default => false    
    
  end
end
