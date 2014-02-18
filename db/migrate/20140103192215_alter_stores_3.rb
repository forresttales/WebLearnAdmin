class AlterStores3 < ActiveRecord::Migration
  def change
    
    add_column :stores, :name_type, :string, :limit => 50    
    add_column :stores, :salutation, :string, :limit => 50    
    
  end
end
