require 'rails_helper'

RSpec.feature 'Splash page', type: :feature do
  describe 'Splash page new user' do
    before do
      visit root_path
    end

    scenario 'I can see the login button' do
      click_link 'LOGIN'
      expect(current_path).to eq(new_user_session_path)
    end

    scenario 'I can see the sign up button' do
      click_link 'SIGN UP'
      expect(current_path).to eq(new_user_registration_path)
    end
  end
end
