class CreateAdminLandings < ActiveRecord::Migration
  def change
    create_table :admin_landings do |t|

      t.timestamps
    end
  end
end
