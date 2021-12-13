class Portfolio < ApplicationRecord
  validates :buyer_id, presence: true
end
