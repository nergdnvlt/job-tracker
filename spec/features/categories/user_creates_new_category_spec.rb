require 'rails_helper'

describe 'User can create a new category' do
  scenario 'a user creates a category' do
    visit new_category_path
    fill_in 'category[name]', with: 'Reaper'
    click_on 'Create Category'

    expect(page).to have_content('Reaper')
  end

  scenario 'a user creates a category' do
    visit new_category_path
    fill_in 'category[name]', with: 'Reaper'
    click_on 'Create Category'

    expect(page).to have_content('Reaper Category Added!')
  end
end
