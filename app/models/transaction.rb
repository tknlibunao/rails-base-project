class Transaction < ApplicationRecord
  belongs_to :market
  belongs_to :portfolio
end
