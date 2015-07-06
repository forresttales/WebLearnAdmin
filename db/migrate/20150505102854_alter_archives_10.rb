class AlterArchives10 < ActiveRecord::Migration
  def change
    
    add_column :archives, :linkimg_carousel, :string
    add_column :archives, :img_height_carousel, :integer, :default => 300
        
  end
end
