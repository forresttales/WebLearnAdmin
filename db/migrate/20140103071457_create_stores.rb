class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|

      # t.string "col1", :limit => 100
      # t.string "col2", :limit => 100
      # t.string "col3", :limit => 100

      t.timestamps
    end
  end
end
