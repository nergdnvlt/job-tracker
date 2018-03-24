require 'rails_helper'

describe 'User sees a specific job' do
  scenario 'a user sees a job for a specific company' do
    company = Company.create!(name: 'Parasites Inc.')
    category = Category.create(name: 'Sanitation')
    job = company.jobs.create!(title: 'Developer',
                               level_of_interest: 70,
                               city: 'Denver',
                               company: company,
                               category: category)

    visit job_path(job)


    expect(current_path).to eq(job_path(Job.last.id))
    expect(page).to have_content(Job.last.company.name)
    expect(page).to have_content(Job.last.description)
    expect(page).to have_content(Job.last.level_of_interest)
    expect(page).to have_content(Job.last.title)
    expect(page).to have_content(Job.last.city)
  end
end
