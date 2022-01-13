class ChangeLogsTableColumnType < ActiveRecord::Migration[6.0]
  def self.up
    change_table :logs do |t|
      t.change :price_bought, :decimal
      t.change :volume_bought, :decimal
      t.change :price_sold, :decimal
      t.change :volume_sold, :decimal
    end
  end
  def self.down
    change_table :logs do |t|
      t.change :price_bought, :integer
      t.change :volume_bought, :integer
      t.change :price_sold, :integer
      t.change :volume_sold, :integer
    end
  end
end
