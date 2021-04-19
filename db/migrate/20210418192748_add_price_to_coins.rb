class AddPriceToCoins < ActiveRecord::Migration[5.2]
  def change
    add_column :coins, :price, :decimal, precision: 8, scale: 2
    add_column :coins, :market_cap, :decimal
    add_column :coins, :volume_24h, :decimal
    add_column :coins, :status_price, :boolean
  end
end
