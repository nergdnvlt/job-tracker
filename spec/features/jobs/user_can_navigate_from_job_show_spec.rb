require 'rails_helper'

describe 'User uses links to navigatge from jobs#index' do
  scenario 'visits /jobs to navigate to company' do
    company = Company.create!(name: 'Parasites Inc.')
    category = Category.create!(name: 'Sanitation')
    job = company.jobs.create!(title: 'Developer',
                               level_of_interest: 70,
                               city: 'Denver',
                               category: category,
                               company: company)

    visit job_path(job)
    click_on company.name

    expect(current_path).to eq(company_path(company))
    expect(page).to have_content(company.name)
  end

  scenario 'visits /jobs ot navigate to city' do
    company = Company.create!(name: 'Parasites Inc.')
    category = Category.create!(name: 'Sanitation')
    job = company.jobs.create!(title: 'Developer',
                               level_of_interest: 70,
                               city: 'Denver',
                               category: category,
                               company: company)
    job2 = company.jobs.create!(title: 'Fly homie Surfer Bum',
                                level_of_interest: 5,
                                city: 'San Diego',
                                category: category,
                                company: company)

    visit job_path(job)
    click_on job.city

    expect(current_path).to eq(jobs_path)
    expect(page).to have_content(job.title)
    expect(page).to_not have_content(job2.title)
  end
end
