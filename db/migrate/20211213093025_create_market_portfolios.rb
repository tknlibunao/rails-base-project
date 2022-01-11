class CreateMarketPortfolios < ActiveRecord::Migration[6.0]
  def change
    create_table :market_portfolios do |t|
      t.references :market, null: false, foreign_key: true
      t.references :portfolio, null: false, foreign_key: true
      t.decimal :price_bought, precision: 8, scale: 2
      t.decimal :volume_bought

      t.timestamps
    end

    # remove duplicate entries/instances for market_portfolio
    # add_index :market_portfolios, [:market_id, :portfolio_id], unique: true
  end
end
