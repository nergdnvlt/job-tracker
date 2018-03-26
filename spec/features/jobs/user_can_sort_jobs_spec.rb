require 'rails_helper'

describe 'the user can view jobs sorted' do
  context 'by city' do
    it 'sorts by city name' do
      company = Company.create!(name: 'Parasites Inc.')
      Job.create!(title: 'Developer',
                  level_of_interest: 70,
                  city: 'Colorado Springs',
                  company: company)
      Job.create!(title: 'Developer',
                  level_of_interest: 70,
                  city: 'z-city',
                  company: company)
      job = Job.create!(title: 'Developer',
                        level_of_interest: 70,
                        city: 'Austin',
                        company: company)

      visit '/jobs?sort=city'
      page.first('a', text: 'Developer').click

      expect(current_path).to eq(job_path(job))
      expect(page).to have_content(job.city)

      visit '/jobs?sort=city'

      page.all('a', text: 'Developer').last.click

      expect(page).to have_content('z-city')
    end
  end

  context 'by interest' do
    it 'sorts by highest interest' do
      company = Company.create!(name: 'Parasites Inc.')
      Job.create!(title: 'Developer',
                  level_of_interest: 13,
                  city: 'Colorado Springs',
                  company: company)
      Job.create!(title: 'Developer',
                  level_of_interest: 70,
                  city: 'z-city',
                  company: company)
      job = Job.create!(title: 'Developer',
                        level_of_interest: 90,
                        city: 'Austin',
                        company: company)

      visit '/jobs?sort=interest'
      page.first('a', text: 'Developer').click

      expect(current_path).to eq(job_path(job))
      expect(page).to have_content(job.level_of_interest)
      expect(page).to have_content(job.city)
      expect(page).to have_content(job.title)

      visit '/jobs?sort=interest'

      page.all('a', text: 'Developer').last.click

      expect(page).to have_content('Colorado Springs')
      expect(page).to have_content('13')
    end
  end
end

