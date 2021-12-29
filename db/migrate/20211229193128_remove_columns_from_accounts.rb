class RemoveColumnsFromAccounts < ActiveRecord::Migration[6.0]
  def change
    remove_column :accounts, :created_by, :string
    remove_column :accounts, :admin_id, :integer
    remove_column :accounts, :user_id, :integer
  end
end
