require 'rails_helper'

describe 'User sees one company' do
  scenario 'a user sees a company' do
    company = Company.create!(name: 'ESPN')
    company.jobs.create!(title: 'Developer',
                         level_of_interest: 90,
                         city: 'Denver')

    visit company_path(company)

    expect(current_path).to eq(company_path(company))
    expect(page).to have_content('Contacts')
    expect(page).to have_content('Jobs')
  end

  scenario 'user sees all the companys contacts' do
    company = Company.create!(name: 'ESPN')
    company.jobs.create!(title: 'Developer',
                         level_of_interest: 90,
                         city: 'Denver')
    contact = company.contacts.create(name: 'Barry Allen',
                                     position: 'Speedster',
                                     email: 'ballen@domain.com')

    visit company_path(company)

    expect(page).to have_content(contact.name)
    expect(page).to have_content(contact.position)
    expect(page).to have_content(contact.email)
  end

  scenario 'user sees all the companys jobs' do
    company = Company.create!(name: 'ESPN')
    job = company.jobs.create!(title: 'Developer',
                               level_of_interest: 90,
                               city: 'Denver')

    visit company_path(company)

    expect(page).to have_content(job.title)
  end
end
