require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) {User.new}
  
  context 'validations' do
    it 'renders correct validation errors' do
      user.username = "nil"
      user.password = "1234"
      user.email = "test.com"

      expect(user).to_not be_valid
      expect(user.errors).to be_present
      expect(user.errors.to_hash.keys).to include(:password)
    end

    it 'does not save when user inputs existing email address' do
      User.create(:username => 'Duplicate Name', :email => 'Duplicate@user.com')
      user.username = 'Duplicate Name'
      user.email = 'Duplicate@user.com'

      expect(user).not_to be_valid
      expect(user.errors).to be_present
      
    end
  end
end

#bundle exec rspec spec/models/user_spec.rb