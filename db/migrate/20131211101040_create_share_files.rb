class CreateShareFiles < ActiveRecord::Migration
  def change
    create_table :share_files do |t|

      t.string "name_originator", :limit => 50      
      t.string "name_file", :limit => 50      

      t.timestamps
    end
  end
end
