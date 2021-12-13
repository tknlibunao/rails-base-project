class Market < ApplicationRecord
  validates :stock_name, :volume, presence: true
end
