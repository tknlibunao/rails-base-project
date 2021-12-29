class Account < ApplicationRecord
    validates :first_name, :last_name, :contact_number, :address, presence: true
    validates :verified, default: false

    belongs_to :user

    has_one :wallet

end
