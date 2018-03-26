require 'rails_helper'

describe 'User sees a categories' do
  scenario 'a user sees all the categories' do
    category = Category.create!(name: 'Sports')

    visit category_path(category)

    expect(page).to have_content(category.name)
  end
end
