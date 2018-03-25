require 'rails_helper'

describe 'user visits the dashboard' do
  describe 'they see' do
    it 'top three companies' do
      company_1 = Company.create!(name: 'Parasites Inc.')
      company_2 = Company.create!(name: 'Wayne Enterprises')
      company_3 = Company.create!(name: 'Cap Corp')
      company_4 = Company.create!(name: 'Bad Company')

      Job.create!(title: 'Software',
                  level_of_interest: 100,
                  city: 'Denver',
                  company: company_1,
                  description: 'A')
      Job.create!(title: 'Something',
                  level_of_interest: 90,
                  city: 'Denver',
                  company: company_1,
                  description: 'Really')
      Job.create!(title: 'Tasty',
                  level_of_interest: 80,
                  city: 'Denver',
                  company: company_2,
                  description: 'Nice')
      Job.create!(title: 'Jam',
                  level_of_interest: 70,
                  city: 'Denver',
                  company: company_2,
                  description: 'Description')
      Job.create!(title: 'Barn',
                  level_of_interest: 74,
                  city: 'Denver',
                  company: company_3,
                  description: 'Dude')
      Job.create!(title: 'Alpine',
                  level_of_interest: 31,
                  city: 'Downtown',
                  company: company_4,
                  description: 'Bad')


      visit '/dashboard'

      expect(page).to have_content('The Big Three')
      expect(page).to have_content(company_1.name)
      expect(page).to have_content(company_2.name)
      expect(page).to have_content(company_3.name)
      expect(page).to_not have_content(company_4.name)
      expect(page).to have_content('95')
      expect(page).to have_content('75')
      expect(page).to have_content('74')
      expect(page).to_not have_content('30')
    end

    it 'shows all present locations' do
      company_1 = Company.create!(name: 'Parasites Inc.')
      company_2 = Company.create!(name: 'Wayne Enterprises')
      company_3 = Company.create!(name: 'Cap Corp')
      company_4 = Company.create!(name: 'Bad Company')

      Job.create!(title: 'Software',
                  level_of_interest: 100,
                  city: 'Los Angeles',
                  company: company_1,
                  description: 'A')
      Job.create!(title: 'Something',
                  level_of_interest: 90,
                  city: 'Denver',
                  company: company_1,
                  description: 'Really')
      Job.create!(title: 'Tasty',
                  level_of_interest: 80,
                  city: 'Denver',
                  company: company_2,
                  description: 'Nice')
      Job.create!(title: 'Jam',
                  level_of_interest: 70,
                  city: 'Denver',
                  company: company_2,
                  description: 'Description')
      Job.create!(title: 'Barn',
                  level_of_interest: 74,
                  city: 'Denver',
                  company: company_3,
                  description: 'Dude')
      Job.create!(title: 'Alpine',
                  level_of_interest: 31,
                  city: 'Downtown',
                  company: company_4,
                  description: 'Bad')

      visit '/dashboard'

      expect(page).to have_content('Los Angeles: 1', count: 1)
      expect(page).to have_content('Denver: 4', count: 1)
      expect(page).to have_content('Downtown: 1', count: 1)
    end

    it 'groups by level of interest' do
      company = Company.create!(name: 'Bad Company')
      Job.create!(title: 'Software',
                  level_of_interest: 100,
                  city: 'Los Angeles',
                  company: company,
                  description: 'Supercalifragelisticexpialidociouse')
      Job.create!(title: 'Software',
                  level_of_interest: 100,
                  city: 'Denver',
                  company: company,
                  description: 'Supercalifragelisticexpialidociouse')
      Job.create!(title: 'Software',
                  level_of_interest: 32,
                  city: 'Denver',
                  company: company,
                  description: 'Supercalifragelisticexpialidociouse')

      visit '/dashboard'

      expect(page).to have_content('Jobs by Interest')
      expect(page).to have_content('100: 2')
      expect(page).to have_content('32: 1')
    end
  end

  describe 'click links' do
    it 'click city' do
      company = Company.create!(name: 'Bad Company')

      Job.create!(title: 'Software',
                  level_of_interest: 100,
                  city: 'Los Angeles',
                  company: company,
                  description: 'Supercalifragelisticexpialidociouse')
      Job.create!(title: 'QA',
                  level_of_interest: 100,
                  city: 'Denver',
                  company: company,
                  description: 'Supercalifragelisticexpialidociouse')

      visit '/dashboard'
      click_link 'Los Angeles'

      expect(current_url).to eq('http://www.example.com/jobs?location=Los+Angeles')
      expect(page).to have_content('Software')
      expect(page).to_not have_content('QA')

      visit '/dashboard'
      click_on 'Denver'

      expect(current_url).to eq('http://www.example.com/jobs?location=Denver')
      expect(page).to have_content('QA')
      expect(page).to_not have_content('Software')
    end

    it 'click interest' do
      company = Company.create!(name: 'Bad Company')

      Job.create!(title: 'Software',
                  level_of_interest: 100,
                  city: 'Los Angeles',
                  company: company,
                  description: 'Supercalifragelisticexpialidociouse')
      Job.create!(title: 'Software',
                  level_of_interest: 100,
                  city: 'Denver',
                  company: company,
                  description: 'Supercalifragelisticexpialidociouse')
      Job.create!(title: 'QA',
                  level_of_interest: 99,
                  city: 'Denver',
                  company: company,
                  description: 'Supercalifragelisticexpialidociouse')

      visit '/dashboard'

      click_on '100'

      expect(current_url).to eq('http://www.example.com/jobs?interest=100')
      expect(page).to have_content('Software at Bad Company')
      expect(page).to_not have_content('QA')
    end
  end
end
