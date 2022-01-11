class Market < ApplicationRecord
  validates :stock_name, :volume, presence: true

  # has_many :market_portfolios
  # has_many :portfolios, through: :market_portfolios
  
  has_many :logs
  has_many :portfolios, through: :logs
end
