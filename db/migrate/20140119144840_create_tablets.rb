class CreateTablets < ActiveRecord::Migration
  def change
    create_table :tablets do |t|

      t.string "col_1", :limit => 300
      t.string "col_2", :limit => 300
      t.string "col_3", :limit => 300
      t.string "col_4", :limit => 300
      t.string "col_5", :limit => 300
      t.string "col_6", :limit => 300
      t.string "col_7", :limit => 300
      t.string "col_8", :limit => 300
      t.string "col_9", :limit => 300
      t.string "col_10", :limit => 300
      t.string "col_11", :limit => 300
      t.string "col_12", :limit => 300
      t.string "col_13", :limit => 300
      t.string "col_14", :limit => 300
      t.string "col_15", :limit => 300
      t.string "col_16", :limit => 300
      t.string "col_17", :limit => 300
      t.string "col_18", :limit => 300
      t.string "col_19", :limit => 300
      t.string "col_20", :limit => 300

      t.timestamps
    end
  end
end
