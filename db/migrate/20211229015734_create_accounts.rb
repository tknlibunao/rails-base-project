class CreateAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :accounts do |t|
      t.string :first_name
      t.string :last_name
      t.integer :contact_number
      t.text :address
      t.boolean :verified, :default => false
      t.datetime :verified_at

      t.timestamps
    end
  end
end
