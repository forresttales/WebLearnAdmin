class CreateAdminRegLetters < ActiveRecord::Migration
  def change
    create_table :admin_reg_letters do |t|

      t.timestamps
    end
  end
end
