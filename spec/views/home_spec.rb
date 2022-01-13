require 'rails_helper'

RSpec.describe 'Home', type: :feature do 
  describe 'Home page' do
    before {visit root_path}
    it 'shows log in and sign up options' do
      within 'body' do
        expect(page).to have_content('Log In')
        expect(page).to have_content('Sign Up')
      end
    end

  end
  
end

#   bundle exec rspec spec/views/home_spec.rb