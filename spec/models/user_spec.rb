require 'rails_helper'

RSpec.describe User, type: :model do
  it "creates automatic first name and last name for user" do 
    user1 = User.new
    expect(user1.first_name) .to be("Sample")
  end
end

#bundle exec rspec spec/models/user_spec.rb