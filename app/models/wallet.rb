class Wallet < ApplicationRecord
    validates :buyer_id, :actual_balance, presence: true

    #belongs_to :account
end
