class CreateWallets < ActiveRecord::Migration[6.0]
  def change 
    create_table :wallets do |t|
      t.integer :wallet_id
      t.decimal :actual_balance

      t.timestamps
    end
  end
end
