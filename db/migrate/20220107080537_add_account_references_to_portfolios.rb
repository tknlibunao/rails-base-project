class AddAccountReferencesToPortfolios < ActiveRecord::Migration[6.0]
  def change
    add_reference :portfolios, :account, null: false, foreign_key: true
  end
end
