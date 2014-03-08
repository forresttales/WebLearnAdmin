class AlterMtab5lets1 < ActiveRecord::Migration
  def change
    
    remove_column("mtab5lets", "col_41")    
    remove_column("mtab5lets", "col_42")    
    remove_column("mtab5lets", "col_43")    
    remove_column("mtab5lets", "col_44")    
    remove_column("mtab5lets", "col_45")    
    remove_column("mtab5lets", "col_46")    
    remove_column("mtab5lets", "col_47")    
    remove_column("mtab5lets", "col_48")    
    remove_column("mtab5lets", "col_49")    
    remove_column("mtab5lets", "col_50")    
    
    add_column :mtab5lets, :col_41, :integer, :default => 0
    add_column :mtab5lets, :col_42, :integer, :default => 0
    add_column :mtab5lets, :col_43, :integer, :default => 0
    add_column :mtab5lets, :col_44, :integer, :default => 0
    add_column :mtab5lets, :col_45, :integer, :default => 0
    add_column :mtab5lets, :col_46, :integer, :default => 0
    add_column :mtab5lets, :col_47, :integer, :default => 0
    add_column :mtab5lets, :col_48, :integer, :default => 0
    add_column :mtab5lets, :col_49, :integer, :default => 0
    add_column :mtab5lets, :col_50, :integer, :default => 0
    
  end
end
