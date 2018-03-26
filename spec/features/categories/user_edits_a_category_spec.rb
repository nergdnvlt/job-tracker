require 'rails_helper'

describe 'User can edit a categories' do
  scenario 'a user edits the category' do
    category = Category.create!(name: 'Sports')

    visit edit_category_path(category)
    fill_in 'category[name]', with: 'Reaper'
    click_on 'Update Category'

    expect(page).to have_content('Reaper')
    expect(page).to_not have_content(category.name)
  end

  scenario 'a user sees flash message for updated categories' do
    category = Category.create!(name: 'Sports')

    visit edit_category_path(category)
    fill_in 'category[name]', with: 'Reaper'
    click_on 'Update Category'

    expect(page).to have_content('Category Updated')
  end
end
