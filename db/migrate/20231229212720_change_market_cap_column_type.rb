class ChangeMarketCapColumnType < ActiveRecord::Migration[7.1]
  def change
    change_column :stocks, :marketCap, :bigint
  end
end
