require 'rails_helper'

describe 'User edits a job' do
  scenario 'a user can edit a job from index' do
    company = Company.create!(name: 'Parasites Inc.')
    category = Category.create(name: 'Sanitation')
    job = company.jobs.create!(title: 'Developer',
                               level_of_interest: 70,
                               city: 'Denver',
                               company: company,
                               category: category)

    visit jobs_path

    click_link 'Edit'

    fill_in 'job[title]', with: 'Superhero'
    fill_in 'job[description]', with: 'Saving people'
    fill_in 'job[level_of_interest]', with: 95
    fill_in 'job[city]', with: 'Tampa'
    click_button 'Update Job'

    expect(page).to have_content('Superhero')
    expect(page).to have_content('Saving people')
    expect(page).to have_content('95')
    expect(page).to have_content('Tampa')
  end

  scenario 'a user can edit a job from show' do
    company = Company.create!(name: 'Parasites Inc.')
    category = Category.create(name: 'Sanitation')
    job = company.jobs.create!(title: 'Developer',
                               level_of_interest: 70,
                               city: 'Denver',
                               company: company,
                               category: category)

    visit job_path(job)

    click_link 'Edit'

    fill_in 'job[title]', with: 'Bobber man'
    fill_in 'job[description]', with: 'Riding bikes'
    fill_in 'job[level_of_interest]', with: 100
    fill_in 'job[city]', with: 'San Diego'
    click_button 'Update Job'

    expect(page).to have_content('Bobber man')
    expect(page).to have_content('Riding bikes')
    expect(page).to have_content('100')
    expect(page).to have_content('San Diego')
  end
end
