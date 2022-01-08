class ChangeBuyersToAccounts < ActiveRecord::Migration[6.0]
  def change
    rename_table :buyers, :accounts
  end
end
