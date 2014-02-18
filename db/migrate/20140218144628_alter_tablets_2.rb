class AlterTablets2 < ActiveRecord::Migration
  def change
    
    add_column :tablets, :col_id, :integer
    
  end
end
