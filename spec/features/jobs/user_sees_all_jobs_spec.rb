require 'rails_helper'

describe 'User sees all jobs' do
  scenario 'a user sees all the jobs for a specific company' do
    company = Company.create!(name: 'Parasites Inc.')
    category = Category.create!(name: 'Sanitation')
    job1 = company.jobs.create!(title: 'Developer',
                                level_of_interest: 70,
                                city: 'Denver',
                                category: category,
                                company: company)
    job2 = company.jobs.create!(title: 'Runner',
                                level_of_interest: 70,
                                city: 'Denver',
                                category: category,
                                company: company)

    visit jobs_path

    expect(page).to have_content(job1.title)
    expect(page).to have_content(job2.title)
  end
end
