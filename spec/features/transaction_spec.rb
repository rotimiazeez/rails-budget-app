require 'rails_helper'

RSpec.feature 'Transaction page', type: :feature do
  login_user

  background do
    @category = FactoryBot.create(:category, user: @user)
    FactoryBot.build_list(:activity, 1, author: @user, category_ids: [@category.id])
  end

  scenario 'The user can see a list of transactions' do
    visit category_path(@category)
    @category.activities.each do |activity|
      expect(page).to have_content activity.name
    end
  end

  scenario 'The user can see the total amount for the category' do
    visit category_path(@category)
    expect(page).to have_content @category.total_amount
  end

  scenario 'The page has an add new transaction button' do
    visit category_path(@category)
    click_link 'ADD A NEW TRANSACTION'
    expect(page).to have_current_path(new_activity_path)
  end
end
