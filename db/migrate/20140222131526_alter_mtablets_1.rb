class AlterMtablets1 < ActiveRecord::Migration
  def change
    
    remove_column("mtablets", "col_41")    
    remove_column("mtablets", "col_42")    
    remove_column("mtablets", "col_43")    
    remove_column("mtablets", "col_44")    
    remove_column("mtablets", "col_45")    
    remove_column("mtablets", "col_46")    
    remove_column("mtablets", "col_47")    
    remove_column("mtablets", "col_48")    
    remove_column("mtablets", "col_49")    
    remove_column("mtablets", "col_50")    
    
    add_column :mtablets, :col_41, :integer, :default => 0
    add_column :mtablets, :col_42, :integer, :default => 0
    add_column :mtablets, :col_43, :integer, :default => 0
    add_column :mtablets, :col_44, :integer, :default => 0
    add_column :mtablets, :col_45, :integer, :default => 0
    add_column :mtablets, :col_46, :integer, :default => 0
    add_column :mtablets, :col_47, :integer, :default => 0
    add_column :mtablets, :col_48, :integer, :default => 0
    add_column :mtablets, :col_49, :integer, :default => 0
    add_column :mtablets, :col_50, :integer, :default => 0
    
  end
end
