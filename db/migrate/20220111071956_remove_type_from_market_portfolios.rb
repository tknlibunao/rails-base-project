class RemoveTypeFromMarketPortfolios < ActiveRecord::Migration[6.0]
  def change
    remove_column :market_portfolios, :type, :string
  end
end
