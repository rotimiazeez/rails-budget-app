require 'rails_helper'

RSpec.feature 'Add Transaction', type: :feature do
  login_user

  background do
    @category = FactoryBot.create(:category, user: @user)
  end

  given(:activity) { FactoryBot.build(:activity) }

  scenario 'Transaction with valid inputs' do
    visit new_activity_path
    within 'form' do
      fill_in 'Name', with: activity.name
      fill_in 'Amount', with: activity.amount
      select @category.name
    end
    click_button 'SAVE'
    expect(page).to have_current_path category_path(@category)
  end

  scenario 'Category with invalid inputs' do
    visit new_activity_path
    within 'form' do
      fill_in 'Name', with: activity.name
      fill_in 'Amount', with: activity.amount
    end
    click_button 'SAVE'
    expect(page).to have_content "Categories can't be blank"
  end
end
