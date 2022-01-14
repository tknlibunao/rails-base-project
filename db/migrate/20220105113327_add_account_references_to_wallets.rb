class AddAccountReferencesToWallets < ActiveRecord::Migration[6.0]
  def change
    add_reference :wallets, :account, null: false, foreign_key: true
  end
end
