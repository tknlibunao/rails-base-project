class Market < ApplicationRecord
  validates :stock_name, :volume, presence: true

  # has_many :market_portfolios
  # has_many :porfolios, through: :market_portfolios
  
  has_many :transactions
  has_many :porfolios, through: :transactions
end
