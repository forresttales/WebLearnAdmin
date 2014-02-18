class CreateAdminUserImages < ActiveRecord::Migration
  def change
    create_table :admin_user_images do |t|

      t.integer "admin_user_id"
      t.string "image_name", :limit => 100

      t.timestamps
    end
    
    add_index("admin_user_images", "admin_user_id")
    
  end
end
