class CreateAdminRegEvents < ActiveRecord::Migration
  def change
    create_table :admin_reg_events do |t|

      t.timestamps
    end
  end
end
