class AlterArchives11 < ActiveRecord::Migration
  def change
    
    add_column :archives, :subtitle_1_carousel, :string
    add_column :archives, :subtitle_2_carousel, :string
    
  end
end
