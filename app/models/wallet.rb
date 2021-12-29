class Wallet < ApplicationRecord
    validates :account_id, :actual_balance, presence: true

    belongs_to :account
end
