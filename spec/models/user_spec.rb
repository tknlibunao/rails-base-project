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
  end

end

#bundle exec rspec spec/models/user_spec.rb