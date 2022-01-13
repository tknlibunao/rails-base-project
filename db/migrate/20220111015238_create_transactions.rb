class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.references :market, null: false, foreign_key: true
      t.references :portfolio, null: false, foreign_key: true
      t.integer :price_bought
      t.integer :volume_bought
      t.integer :price_sold
      t.integer :volume_sold

      t.timestamps
    end
  end
end
