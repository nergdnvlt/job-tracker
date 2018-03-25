require 'rails_helper'

describe 'User sees jobs for a specific location' do
  scenario 'visits /jobs?category=Sanitation' do
    company = Company.create!(name: 'Parasites Inc.')
    category = Category.create!(name: 'Sanitation')
    category2 = Category.create!(name: 'Development')
    company.jobs.create!(title: 'Developer',
                         level_of_interest: 70,
                         city: 'Denver',
                         category: category,
                         company: company)
    company.jobs.create!(title: 'Runner',
                         level_of_interest: 70,
                         city: 'San Francisco',
                         category: category2,
                         company: company)

    visit '/jobs?category=Sanitation'

    expect(page).to have_content('Developer')
    expect(page).to_not have_content('Runner')
  end
end
