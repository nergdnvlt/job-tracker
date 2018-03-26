require 'rails_helper'

describe 'User creates a new company' do
  scenario 'a user can create a new company' do
    visit new_company_path

    fill_in 'company[name]', with: 'ESPN'
    click_button 'Create'

    expect(current_path).to eq(company_path(Company.last.id))
    expect(page).to have_content('ESPN')
    expect(Company.count).to eq(1)
  end

  scenario 'a user sees flash message for company creation' do
    visit new_company_path

    fill_in 'company[name]', with: 'ESPN'
    click_button 'Create'

    expect(page).to have_content('ESPN Added!')
  end
end
