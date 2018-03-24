require 'rails_helper'

describe 'User sees all jobs' do
  scenario 'a user sees all the jobs for a specific company' do
    company = Company.create!(name: 'Parasites Inc.')
    category = Category.create!(name: 'Sanitation')
    company.jobs.create!(title: 'Developer',
                         level_of_interest: 70,
                         city: 'Denver',
                         category: category,
                         company: company)
    company.jobs.create!(title: 'Runner',
                         level_of_interest: 70,
                         city: 'Denver',
                         category: category,
                         company: company)

    visit jobs_path

    expect(page).to have_content('Developer')
    expect(page).to have_content('Runner')
  end
end
