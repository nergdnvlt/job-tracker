require 'rails_helper'

describe 'User uses links to navigatge' do
  scenario 'visits /jobs' do
    company = Company.create!(name: 'Parasites Inc.')
    category = Category.create!(name: 'Sanitation')
    company.jobs.create!(title: 'Developer',
                         level_of_interest: 70,
                         city: 'Denver',
                         category: category,
                         company: company)

    visit jobs_path
    click_on 'Parasites Inc'

    expect(current_path).to eq(company_path(company))
    expect(page).to have_content('Parasites Inc.')
  end
end
