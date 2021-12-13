class Market < ApplicationRecord
  validates :stock_name, :volume, presence: true

  has_many :market_portfolios
  has_many :porfolios, through: :market_portfolios
end
