require 'rails_helper'

RSpec.describe "Devise", type: :feature do

  def seeds
    user1 = User.create(email: 'admin@gmail.com', password: '12345678', password_confirmation: '12345678', username: 'admin', user_type: 'Admin')
    user1.add_role(:admin)
    
    user2 = User.create(email: 'tknlibunao@gmail.com', password: '12345678', password_confirmation: '12345678', username: 'tknlibunao', user_type: 'Buyer')
    user2.add_role(:buyer)
  end

  def sign_up_buyer
    click_link('Sign up')
    fill_in "user[email]", with: "buyer@test.com"
    fill_in "user[username]", with: "buyer_test"
    fill_in "user[password]", with: "123456"
    fill_in "user[password_confirmation]", with: "123456"
    select "Buyer", :from => "user[type]"

    click_button('Sign up')
  end

  def sign_up_admin
    click_link('Sign up')
    fill_in "user[email]", with: "admin@test.com"
    fill_in "user[username]", with: "admin_test"
    fill_in "user[password]", with: "123456"
    fill_in "user[password_confirmation]", with: "123456"
    select "Admin", :from => "user[type]"

    click_button('Sign up')
  end

  def admin_log_in
    click_link('Sign in')
    fill_in "user[email]", with: "admin@gmail.com"
    fill_in "user[password]", with: "12345678"

    click_button('Log in')
  end

  def buyer_log_in
    click_link('Sign in')
    fill_in "user[email]", with: "tknlibunao@gmail.com"
    fill_in "user[password]", with: "12345678"

    click_button('Log in')
  end

  describe "on visit" do
    before {seeds}
    before {visit root_path}

    it "shows Log in and Sign up on nav bar" do
      expect(page).to have_content("Log In")
      expect(page).to have_content("Sign Up")
    end

    it "shows error on submit when email is blank" do
      click_link('Sign Up')
      fill_in "user[email]", with: nil
      fill_in "user[password]", with: "12345678"
      fill_in "user[password_confirmation]", with: "12345678"

      select "Buyer", :from => "user[type]"
      click_button('Sign Up')

      expect(user.errors).to be_present
      expect(user.errors).to have_content("Email can't be blank")
    end
    
    it "shows error on submit when password does not match" do
      click_link('Sign up')
      fill_in "user[email]", with: "hello@test.com"
      fill_in "user[password]", with: "12345678"
      fill_in "user[password_confirmation]", with: "12121212"

      select "Admin", :from => "user[type]"
      click_button('Sign up')

      expect(page).to have_content("Password confirmation doesn't match Password")
    end

    it "redirects to wallets view when buyer signs up" do
      sign_up_buyer

      expect(page).to have_content("Wallet")
      expect(page).to_not have_content("Accounts")
    end

    it "signs out properly" do
      sign_up_admin
      click_link('Log Out')

      expect(page).to have_content("Log In")
    end

    it "knows when an admin is logged in" do
      admin_log_in
      
      expect(page).to have_content("Administrator controls")
    end

  end
end

#   bundle exec rspec spec/views/devise_spec.rb