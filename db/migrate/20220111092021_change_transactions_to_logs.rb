class ChangeTransactionsToLogs < ActiveRecord::Migration[6.0]
  def change
    rename_table :transactions, :logs
  end
end
