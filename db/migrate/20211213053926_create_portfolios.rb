class CreatePortfolios < ActiveRecord::Migration[6.0]
  def change
    create_table :portfolios do |t|
      t.integer :account_id, foreign_key: true

      t.timestamps
    end
  end
end
