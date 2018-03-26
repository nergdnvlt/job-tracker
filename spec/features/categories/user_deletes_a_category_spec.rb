require 'rails_helper'

describe 'User deletes a categories' do
  scenario 'a user deletes a category' do
    category = Category.create!(name: 'Sports')

    visit categories_path
    click_on 'Delete'

    expect(page).to_not have_content(category.name)
  end

  scenario 'a user deletes a category and sees flash' do
    Category.create!(name: 'Sports')

    visit categories_path
    click_on 'Delete'

    expect(page).to have_content('Category Deleted!')
  end
end
