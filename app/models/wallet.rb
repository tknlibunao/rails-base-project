class Wallet < ApplicationRecord
    validates :actual_balance, presence: true

    belongs_to :account

end
