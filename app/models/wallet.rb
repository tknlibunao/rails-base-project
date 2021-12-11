class Wallet < ApplicationRecord
    validates :first_name, :last_name, :contact_number, :address, presence: true
end
