class Account < ApplicationRecord
    validates :first_name, :last_name, :contact_number, :address, :verified, :verified_at, presence: true
    validates :verified, default: false

    belongs_to :user

    has_one :wallet

end
