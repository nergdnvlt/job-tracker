require 'rails_helper'

describe 'User sees all categories' do
  scenario 'a user sees all the categories' do
    category1 = Category.create!(name: 'Sports')
    category2 = Category.create!(name: 'Hero-ish')

    visit categories_path

    expect(page).to have_content('All Categories')
    expect(page).to have_content(category1.name)
    expect(page).to have_content(category2.name)
  end
end
