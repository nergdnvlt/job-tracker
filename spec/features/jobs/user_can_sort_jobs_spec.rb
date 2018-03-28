require 'rails_helper'

describe 'the user can view jobs sorted' do
  context 'by city' do
    it 'sorts by city name' do
      company = Company.create!(name: 'Parasites Inc.')
      category = Category.create!(name: 'Hero')
      Job.create!(title: 'Developer',
                  level_of_interest: 13,
                  city: 'Colorado Springs',
                  company: company,
                  category: category)
      Job.create!(title: 'Developer',
                  level_of_interest: 70,
                  city: 'z-city',
                  company: company,
                  category: category)
      job = Job.create!(title: 'Developer',
                        level_of_interest: 90,
                        city: 'Austin',
                        company: company,
                        category: category)

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
      category = Category.create!(name: 'Hero')
      job1 = Job.create!(title: 'Developer',
                         level_of_interest: 13,
                         city: 'Colorado Springs',
                         company: company,
                         category: category)
      job2 = Job.create!(title: 'Developer',
                         level_of_interest: 70,
                         city: 'z-city',
                         company: company,
                         category: category)
      job3 = Job.create!(title: 'Developer',
                         level_of_interest: 90,
                         city: 'Austin',
                         company: company,
                         category: category)

      visit '/jobs?sort=interest'
      page.first('a', text: 'Developer').click

      expect(current_path).to eq(job_path(job3))
      expect(page).to have_content(job3.level_of_interest)
      expect(page).to have_content(job3.city)
      expect(page).to have_content(job3.title)

      visit '/jobs?sort=interest'

      page.all('a', text: 'Developer').last.click

      expect(page).to have_content(job1.city)
      expect(page).to have_content(job1.level_of_interest)
    end
  end
end
