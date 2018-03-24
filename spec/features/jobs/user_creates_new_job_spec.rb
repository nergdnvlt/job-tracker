require 'rails_helper'

describe 'User creates a new job' do
  scenario 'a user can create a new job' do
    Company.create!(name: 'Parasites Inc.')
    Category.create!(name: 'Sanitation')
    visit new_job_path

    fill_in 'job[title]', with: 'Developer'
    fill_in 'job[description]', with: 'So fun!'
    fill_in 'job[level_of_interest]', with: 80
    fill_in 'job[city]', with: 'Denver'
    select 'Parasites Inc.', from: 'job[company_id]'
    select 'Sanitation', from: 'job[category_id]'

    click_button 'Create'

    expect(current_path).to eq(job_path(Job.last.id))
    expect(page).to have_content(Job.last.company.name)
    expect(page).to have_content(Job.last.description)
    expect(page).to have_content(Job.last.level_of_interest)
    expect(page).to have_content(Job.last.title)
    expect(page).to have_content(Job.last.city)
  end
end
