class AlterTablets1 < ActiveRecord::Migration
  def change
    
    add_column :tablets, :col_21, :string, :limit => 300
    add_column :tablets, :col_22, :string, :limit => 300
    add_column :tablets, :col_23, :string, :limit => 300
    add_column :tablets, :col_24, :string, :limit => 300
    add_column :tablets, :col_25, :string, :limit => 300
    
  end
end
