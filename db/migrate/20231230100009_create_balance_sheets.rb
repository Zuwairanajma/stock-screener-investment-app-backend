class CreateBalanceSheets < ActiveRecord::Migration[7.1]
  def change
    create_table :balance_sheets do |t|

      t.timestamps
    end
  end
end
