class AlterStudents2 < ActiveRecord::Migration
  def change
    add_column("students", "user_id", :integer)    
    
  end
end
