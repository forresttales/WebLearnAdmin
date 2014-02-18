class AlterRegEventItins1 < ActiveRecord::Migration
  def change
    
    add_column :reg_event_itins, :date_event_text, :string, :limit => 50
    add_column :reg_event_itins, :order_display, :integer, :default => 0
    
  end
end
