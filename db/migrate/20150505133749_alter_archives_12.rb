class AlterArchives12 < ActiveRecord::Migration
  def change
    
    change_column_default(:archives, :name_url, 'journal')
    
  end
end
