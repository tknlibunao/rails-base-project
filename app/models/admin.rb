class Admin < ApplicationRecord
    validates :first_name, :last_name, :contact_number, :address, presence: true
    validates_format_of :contact_number,
    :with => /\(?[0-9]{3}\)?-[0-9]{3}-[0-9]{4}/,
    :error => "- Phone numbers must be in xxx-xxx-xxxx format."
end
