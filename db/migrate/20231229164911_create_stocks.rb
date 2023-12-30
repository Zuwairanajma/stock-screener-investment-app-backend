class CreateStocks < ActiveRecord::Migration[7.1]
  def change
    create_table :stocks do |t|
      t.string :symbol
      t.string :companyName
      t.integer :marketCap
      t.string :sector
      t.string :industry
      t.float :beta
      t.float :price
      t.float :lastAnnualDividend
      t.integer :volume
      t.string :exchange
      t.string :exchangeShortName
      t.string :country
      t.boolean :isEtf
      t.boolean :isActivelyTrading
      t.timestamps
    end
  end
end
