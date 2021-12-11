class AddDetailsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :username, :string
    add_column :users, :fullname, :string
    add_column :users, :type, :string
    add_column :users, :verified, :boolean
    add_column :users, :verified_at, :datetime
  end
end
