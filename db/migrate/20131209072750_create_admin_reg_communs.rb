class CreateAdminRegCommuns < ActiveRecord::Migration
  def change
    create_table :admin_reg_communs do |t|

      t.timestamps
    end
  end
end
