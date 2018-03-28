require 'rails_helper'

describe 'user wants to see' do
  scenario 'all 1 star jobs' do
    company = Company.create!(name: 'Parasites Inc.')
    category = Category.create!(name: 'Sanitation')
    job1 = company.jobs.create!(title: 'Developer',
                                level_of_interest: 2,
                                city: 'Denver',
                                category: category,
                                company: company)
    job2 = company.jobs.create!(title: 'Runner',
                                level_of_interest: 70,
                                city: 'San Francisco',
                                category: category,
                                company: company)

    visit '/jobs?interest=1'

    expect(page).to have_content(job1.title)
    expect(page).to_not have_content(job2.title)
  end

  scenario 'all 2 star jobs' do
    company = Company.create!(name: 'Parasites Inc.')
    category = Category.create!(name: 'Sanitation')
    job1 = company.jobs.create!(title: 'Developer',
                                level_of_interest: 39,
                                city: 'Denver',
                                category: category,
                                company: company)
    job2 = company.jobs.create!(title: 'Runner',
                                level_of_interest: 70,
                                city: 'San Francisco',
                                category: category,
                                company: company)

    visit '/jobs?interest=2'

    expect(page).to have_content(job1.title)
    expect(page).to_not have_content(job2.title)
  end

  scenario 'all 3 star jobs' do
    company = Company.create!(name: 'Parasites Inc.')
    category = Category.create!(name: 'Sanitation')
    job1 = company.jobs.create!(title: 'Developer',
                                level_of_interest: 50,
                                city: 'Denver',
                                category: category,
                                company: company)
    job2 = company.jobs.create!(title: 'Runner',
                                level_of_interest: 70,
                                city: 'San Francisco',
                                category: category,
                                company: company)

    visit '/jobs?interest=3'

    expect(page).to have_content(job1.title)
    expect(page).to_not have_content(job2.title)
  end

  scenario 'all 4 star jobs' do
    company = Company.create!(name: 'Parasites Inc.')
    category = Category.create!(name: 'Sanitation')
    job1 = company.jobs.create!(title: 'Developer',
                                level_of_interest: 70,
                                city: 'Denver',
                                category: category,
                                company: company)
    job2 = company.jobs.create!(title: 'Runner',
                                level_of_interest: 1,
                                city: 'San Francisco',
                                category: category,
                                company: company)

    visit '/jobs?interest=4'

    expect(page).to have_content(job1.title)
    expect(page).to_not have_content(job2.title)
  end

  scenario 'all 1 star jobs' do
    company = Company.create!(name: 'Parasites Inc.')
    category = Category.create!(name: 'Sanitation')
    job1 = company.jobs.create!(title: 'Developer',
                                level_of_interest: 100,
                                city: 'Denver',
                                category: category,
                                company: company)
    job2 = company.jobs.create!(title: 'Runner',
                                level_of_interest: 70,
                                city: 'San Francisco',
                                category: category,
                                company: company)

    visit '/jobs?interest=5'

    expect(page).to have_content(job1.title)
    expect(page).to_not have_content(job2.title)
  end
end
