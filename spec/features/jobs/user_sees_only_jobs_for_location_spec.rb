require 'rails_helper'

describe 'User sees jobs for a specific location' do
  scenario 'visits /jobs?location=Denver' do
    company = Company.create!(name: 'Parasites Inc.')
    category = Category.create!(name: 'Sanitation')
    company.jobs.create!(title: 'Developer',
                         level_of_interest: 70,
                         city: 'Denver',
                         category: category,
                         company: company)
    company.jobs.create!(title: 'Runner',
                         level_of_interest: 70,
                         city: 'San Francisco',
                         category: category,
                         company: company)

    visit '/jobs?location=Denver'

    expect(page).to have_content('Developer')
    expect(page).to_not have_content('Runner')
  end
end
