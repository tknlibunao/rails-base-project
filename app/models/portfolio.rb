class Portfolio < ApplicationRecord
  belongs_to :account

  has_many :market_portfolios
  has_many :markets, through: :market_portfolios

  accepts_nested_attributes_for :market_portfolios
end
