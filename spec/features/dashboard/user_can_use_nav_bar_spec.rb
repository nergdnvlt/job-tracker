require 'rails_helper'

describe 'User uses links to navigatge to the root' do
  scenario 'visits / to interact with home button' do
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
    click_on 'Home'

    expect(current_path).to eq('/')
    expect(page).to have_content(company1.name)
  end

  scenario 'visits / to interact with Categories nav link' do
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
    click_on 'Categories'

    expect(current_path).to eq(categories_path)
    expect(page).to have_content(category1.name)
    expect(page).to have_content(category2.name)
  end

  scenario 'visits / to interact with Companies nav link' do
    company1 = Company.create!(name: 'Parasites Inc.')
    company2 = Company.create!(name: 'Monsters Inc.')
    # category1 = Category.create!(name: 'Sanitation')
    # category2 = Category.create!(name: 'Development')
    # job1 = company1.jobs.create!(title: 'Developer',
    #                              level_of_interest: 70,
    #                              city: 'Denver',
    #                              category: category1,
    #                              company: company1)
    # job2 = company2.jobs.create!(title: 'Scare Monster',
    #                              level_of_interest: 95,
    #                              city: 'Denver',
    #                              category: category2,
    #                              company: company2)

    visit '/'
    click_on 'Companies'

    expect(current_path).to eq(companies_path)
    expect(page).to have_content(company1.name)
    expect(page).to have_content(company2.name)
  end

  scenario 'visits / to interact with Jobs nav link' do
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
    click_on 'Jobs'

    expect(current_path).to eq(jobs_path)
    expect(page).to have_content(job1.title)
    expect(page).to have_content(job2.title)
  end
end
