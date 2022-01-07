class Account < ApplicationRecord
  validates :first_name, :last_name, presence: true
  validates :verified, default: false
  
  belongs_to :user
  
  has_one :wallet
  has_one :portfolio
  
  after_create :create_wallet, :create_portfolio

  def create_wallet
    if self.user.user_type == 'Buyer'
      Wallet.create(account: self, actual_balance: 50000)
    end
  end

  def create_portfolio
    if self.user.user_type == 'Buyer'
      Portfolio.create(account: self)
    end
  end
end
