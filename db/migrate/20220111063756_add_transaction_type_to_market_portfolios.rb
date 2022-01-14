class AddTransactionTypeToMarketPortfolios < ActiveRecord::Migration[6.0]
  def change
    add_column :market_portfolios, :transaction_type, :string
  end
end
