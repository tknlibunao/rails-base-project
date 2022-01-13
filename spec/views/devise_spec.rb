require 'rails_helper'

RSpec.describe "Devise", type: :feature do

  # def seeds
  #   user1 = User.create(email: 'admin@gmail.com', password: '12345678', password_confirmation: '12345678', username: 'admin', user_type: 'Admin')
  #   user1.add_role(:admin)
    
  #   user2 = User.create(email: 'tknlibunao@gmail.com', password: '12345678', password_confirmation: '12345678', username: 'tknlibunao', user_type: 'Buyer')
  #   user2.add_role(:buyer)
  # end

  # def sign_up_buyer
  #   click_link('Sign up')
  #   fill_in "user[email]", with: "buyer@test.com"
  #   fill_in "user[username]", with: "buyer_test"
  #   fill_in "user[password]", with: "123456"
  #   fill_in "user[password_confirmation]", with: "123456"
  #   select "Buyer", :from => "user[type]"

  #   click_button('Sign up')
  # end

  # def sign_up_admin
  #   click_link('Sign up')
  #   fill_in "user[email]", with: "admin@test.com"
  #   fill_in "user[username]", with: "admin_test"
  #   fill_in "user[password]", with: "123456"
  #   fill_in "user[password_confirmation]", with: "123456"
  #   select "Admin", :from => "user[type]"

  #   click_button('Sign up')
  # end

  # def admin_log_in
  #   click_link('Sign in')
  #   fill_in "user[email]", with: "admin@gmail.com"
  #   fill_in "user[password]", with: "12345678"

  #   click_button('Log in')
  # end

  # def buyer_log_in
  #   click_link('Sign in')
  #   fill_in "user[email]", with: "tknlibunao@gmail.com"
  #   fill_in "user[password]", with: "12345678"

  #   click_button('Log in')
  # end

end

#   bundle exec rspec spec/views/devise_spec.rb\