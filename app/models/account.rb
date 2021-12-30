class Account < ApplicationRecord
    validates :first_name, :last_name, :contact_number, :address, presence: true
    validates :verified, default: false

    #has_one :user

    #has_one :wallet

end
