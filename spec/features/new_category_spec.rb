require 'rails_helper'

RSpec.feature 'Add Category', type: :feature do
  login_user

  given(:category) { FactoryBot.build(:category) }

  scenario 'Category with valid inputs' do
    visit new_category_path
    within 'form' do
      fill_in 'Name', with: category.name
      fill_in 'Icon', with: category.icon
    end
    click_button 'SAVE'
    expect(page).to have_current_path root_path
  end

  scenario 'Category with invalid inputs' do
    visit new_category_path
    within 'form' do
      fill_in 'Name', with: category.name
    end
    click_button 'SAVE'
    expect(page).to have_content "Icon can't be blank"
  end
end
