class Admin < ApplicationRecord
    validates :first_name, :last_name, :contact_number, :address, presence: true

    belongs_to :user
    
    has_many :buyers 
end
