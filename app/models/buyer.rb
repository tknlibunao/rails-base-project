class Buyer < ApplicationRecord
    validates :first_name, :last_name, :contact_number, :address, :verified, :verified_at, :created_by, :admin_id, presence: true
    validates :verified, default: false

    belongs_to :user
    belongs_to :admin

    has_one :wallet

end