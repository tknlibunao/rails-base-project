class CreateRemoveAccountIdColumns < ActiveRecord::Migration[6.0]
  def change
    create_table :remove_account_id_columns do |t|

      t.timestamps
    end
  end
end
