class RemoveBuyerIdFromPortfolios < ActiveRecord::Migration[6.0]
  def change
    remove_column :portfolios, :buyer_id
  end
end
