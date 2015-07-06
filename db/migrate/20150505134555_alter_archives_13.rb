class AlterArchives13 < ActiveRecord::Migration
  def change
    
    change_column_default(:archives, :img_height, 200)
    
  end
end
