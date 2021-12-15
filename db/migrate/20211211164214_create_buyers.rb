class CreateBuyers < ActiveRecord::Migration[6.0]
  def change
    create_table :buyers do |t|
      t.string :first_name
      t.string :last_name
      t.integer :contact_number
      t.text :address
      t.boolean :verified, :default => false
      t.datetime :verified_at
      t.string :created_by
      t.integer :admin_id, foreign_key: true
      t.integer :user_id, foreign_key: true

      t.timestamps
    end
  end
end
