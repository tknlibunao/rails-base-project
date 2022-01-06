class Account < ApplicationRecord
  validates :first_name, :last_name, presence: true
  validates :verified, default: false
  
  belongs_to :user
  
  has_one :wallet
  has_one :portfolio
  
  after_create :create_wallet

  def create_wallet
    if self.user.user_type == 'Buyer'
      Wallet.create(account: self, actual_balance: 50000)
    end
  end
end
