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
end

