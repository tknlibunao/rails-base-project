class Account < ApplicationRecord
  validates :first_name, :last_name, presence: true
  validates :verified, default: false
  
  belongs_to :user
  
  has_one :wallet
  has_one :portfolio
  
end
