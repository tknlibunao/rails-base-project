class Portfolio < ApplicationRecord
  validates :account_id, presence: true

  has_many :market_portfolios
  has_many :markets, through: :market_portfolios

  accepts_nested_attributes_for :market_portfolios

  belongs_to :account
end
