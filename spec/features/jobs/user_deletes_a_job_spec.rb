require 'rails_helper'

describe 'User deletes existing job' do
  scenario 'a user can delete a job from index' do
    company = Company.create!(name: 'Parasites Inc.')
    category = Category.create(name: 'Sanitation')
    job = company.jobs.create!(title: 'Killer',
                               level_of_interest: 70,
                               city: 'Denver',
                               company: company,
                               category: category)

    visit jobs_path

    click_link 'Delete'

    expect(page).to_not have_content(job.title)
  end

  scenario 'a user can delete a job from show' do
    company = Company.create!(name: 'Parasites Inc.')
    category = Category.create(name: 'Sanitation')
    job = company.jobs.create!(title: 'Whaler',
                               level_of_interest: 70,
                               city: 'Denver',
                               company: company,
                               category: category)

    visit job_path(job)
    click_link 'Delete'

    expect(page).to_not have_content(job.title)
  end

  scenario 'a deleted a job shows a flash message' do
    company = Company.create!(name: 'Parasites Inc.')
    category = Category.create(name: 'Sanitation')
    job = company.jobs.create!(title: 'Viking',
                               level_of_interest: 70,
                               city: 'Denver',
                               company: company,
                               category: category)

    visit job_path(job)
    click_link 'Delete'

    expect(page).to have_content('Job Deleted')
  end
end
