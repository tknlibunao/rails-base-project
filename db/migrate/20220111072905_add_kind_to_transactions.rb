class AddKindToTransactions < ActiveRecord::Migration[6.0]
  def change
    add_column :transactions, :kind, :string
  end
end
