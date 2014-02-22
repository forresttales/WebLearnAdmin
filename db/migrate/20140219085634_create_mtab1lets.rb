class CreateMtab1lets < ActiveRecord::Migration
  def change
    create_table :mtab1lets do |t|

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

      t.string "col_21", :limit => 300
      t.string "col_22", :limit => 300
      t.string "col_23", :limit => 300
      t.string "col_24", :limit => 300
      t.string "col_25", :limit => 300
      t.string "col_26", :limit => 300
      t.string "col_27", :limit => 300
      t.string "col_28", :limit => 300
      t.string "col_29", :limit => 300
      t.string "col_30", :limit => 300

      t.string "col_31", :limit => 300
      t.string "col_32", :limit => 300
      t.string "col_33", :limit => 300
      t.string "col_34", :limit => 300
      t.string "col_35", :limit => 300
      t.string "col_36", :limit => 300
      t.string "col_37", :limit => 300
      t.string "col_38", :limit => 300
      t.string "col_39", :limit => 300
      t.string "col_40", :limit => 300

      t.boolean "col_41", :default => false
      t.boolean "col_42", :default => false
      t.boolean "col_43", :default => false
      t.boolean "col_44", :default => false
      t.boolean "col_45", :default => false
      t.boolean "col_46", :default => false
      t.boolean "col_47", :default => false
      t.boolean "col_48", :default => false
      t.boolean "col_49", :default => false
      t.boolean "col_50", :default => false

      t.timestamps
    end
  end
end
