class CreateAddReferencesToAccounts < ActiveRecord::Migration[6.0]
  def change
    change_table :accounts do |t|
      t.references :user
    end
end
