require 'rails_helper'

describe 'User uses links to navigatge from root' do
  scenario 'visits / to navigate to company' do
    company1 = Company.create!(name: 'Parasites Inc.')
    company2 = Company.create!(name: 'Monsters Inc.')
    category1 = Category.create!(name: 'Sanitation')
    category2 = Category.create!(name: 'Development')
    job1 = company1.jobs.create!(title: 'Developer',
                                 level_of_interest: 70,
                                 city: 'Denver',
                                 category: category1,
                                 company: company1)
    job2 = company2.jobs.create!(title: 'Scare Monster',
                                 level_of_interest: 95,
                                 city: 'Denver',
                                 category: category2,
                                 company: company2)

    visit '/'
    click_on company1.name

    expect(current_path).to eq(company_path(company1))
    expect(page).to have_content(company1.name)
  end

  scenario 'visits / to navigate to company' do
    company1 = Company.create!(name: 'Parasites Inc.')
    company2 = Company.create!(name: 'Monsters Inc.')
    category1 = Category.create!(name: 'Sanitation')
    category2 = Category.create!(name: 'Development')
    job1 = company1.jobs.create!(title: 'Developer',
                                 level_of_interest: 70,
                                 city: 'Denver',
                                 category: category1,
                                 company: company1)
    job2 = company2.jobs.create!(title: 'Scare Monster',
                                 level_of_interest: 95,
                                 city: 'Denver',
                                 category: category2,
                                 company: company2)

    visit '/'
    click_on job2.level_of_interest

    expect(current_path).to eq(jobs_path)
    expect(page).to have_content(job2.title)
  end
end
