class AlterAdminUsers2 < ActiveRecord::Migration
  def change
    
    add_column("admin_users", "image_id", :integer)    
    
    add_index :admin_users, :image_id, :name => 'image_id_ix'        
  end
end
