class CreateMarkets < ActiveRecord::Migration[6.0]
  def change
    create_table :markets do |t|
      t.string :stock_name
      t.string :symbol
      t.decimal :volume
      t.integer :trades
      t.decimal :buying_price, precision: 8, scale: 2
      t.decimal :selling_price, precision: 8, scale: 2

      t.timestamps
    end
  end
end
