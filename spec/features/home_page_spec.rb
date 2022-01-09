require 'rails_helper'

RSpec.feature 'Home Page', type: :feature do
  background do
    @user = FactoryBot.create :user_with_categories
    sign_in @user
  end

  scenario 'Once the user logs in, they see the categories/home page' do
    visit categories_path
    expect(page).to have_content 'CATEGORIES'
  end

  scenario 'For each category, user can see name, icon, and total amount that belongs to a category' do
    visit categories_path
    @user.categories.each do |category|
      expect(page).to have_content category.name
    end
  end

  scenario 'When user clicks on an item, it leads to transactions' do
    visit categories_path
    category = @user.categories.first
    find("a[href='#{category_url(category)}']").click
    expect(page).to have_current_path(category_path(category))
  end

  scenario 'The page has an add category button' do
    visit categories_path
    click_link 'ADD A NEW CATEGORY'
    expect(page).to have_current_path(new_category_path)
  end
end
