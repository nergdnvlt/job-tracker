require 'rails_helper'

describe 'User sees a specific job' do
  describe 'a user creates a comment for that job' do
    it'visits a /jobs/:id page to create a comment' do
      company = Company.create!(name: 'Bull Inc.')
      category = Category.create(name: 'Sanitation')
      job = company.jobs.create!(title: 'Developer',
                                 level_of_interest: 70,
                                 city: 'Denver',
                                 company: company,
                                 category: category)

      visit job_path(job)

      fill_in('Content', :with => 'dang good pizza')
      click_on 'Create Comment'

      expect(current_path).to eq(job_path(job.id))
      expect(page).to have_content('dang good pizza')
    end
  end
end
