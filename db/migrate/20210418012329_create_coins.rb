class CreateCoins < ActiveRecord::Migration[5.2]
  def change
    create_table :coins do |t|
      t.string :name
      t.string :symbol
      t.string :slug
      t.integer :cmc_rank
      t.datetime :last_updated

      t.timestamps
    end
  end
end
