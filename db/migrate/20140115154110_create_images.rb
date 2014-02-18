class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.integer "admin_user_id"
      t.string "image_name", :limit => 100
      t.timestamps
    end
    add_index("images", "admin_user_id")
  end
end
