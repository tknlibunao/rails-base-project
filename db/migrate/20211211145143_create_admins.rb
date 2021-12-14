class CreateAdmins < ActiveRecord::Migration[6.0]
  def change
    create_table :admins do |t|
      t.string :first_name
      t.string :last_name
      t.integer :contact_number
      t.text :address

      t.timestamps
    end
  end
end
