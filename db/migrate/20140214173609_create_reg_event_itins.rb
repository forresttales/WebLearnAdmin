class CreateRegEventItins < ActiveRecord::Migration
  def change
    create_table :reg_event_itins do |t|

      t.string "city_state", :limit => 50
      t.date "date_event"
      t.text "address"

      t.timestamps
    end
  end
end
