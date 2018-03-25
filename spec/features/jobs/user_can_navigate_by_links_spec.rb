require 'rails_helper'

describe 'User uses links to navigatge from jobs#index' do
  scenario 'visits /jobs to navigate to company' do
    company = Company.create!(name: 'Parasites Inc.')
    category = Category.create!(name: 'Sanitation')
    company.jobs.create!(title: 'Developer',
                         level_of_interest: 70,
                         city: 'Denver',
                         category: category,
                         company: company)

    visit jobs_path
    click_on company.name

    expect(current_path).to eq(company_path(company))
    expect(page).to have_content(company.name)
  end

  scenario 'visits /jobs ot navigate to job' do
    company = Company.create!(name: 'Parasites Inc.')
    category = Category.create!(name: 'Sanitation')
    job = company.jobs.create!(title: 'Developer',
                               level_of_interest: 70,
                               city: 'Denver',
                               category: category,
                               company: company)

    visit jobs_path
    click_on job.title

    expect(current_path).to eq(job_path(job))
    expect(page).to have_content(job.title)
    expect(page).to have_content(job.level_of_interest)
    expect(page).to have_content(job.city)
  end
end
