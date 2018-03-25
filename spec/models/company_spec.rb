require 'rails_helper'

describe Company do
  describe 'validations' do
    context 'invalid attributes' do
      it 'is invalid without a name' do
        company = Company.new()
        expect(company).to be_invalid
      end

      it 'has a unique name' do
        Company.create(name: 'Dropbox')
        company = Company.new(name: 'Dropbox')
        expect(company).to be_invalid
      end
    end

    context 'valid attributes' do
      it 'is valid with a name' do
        company = Company.new(name: 'Dropbox')
        expect(company).to be_valid
      end
    end
  end

  describe 'relationships' do
    it 'has many jobs' do
      company = Company.new(name: 'Dropbox')
      expect(company).to respond_to(:jobs)
    end

    it 'has many contacts' do
      company = Company.new(name: 'Dropbox')

      expect(company).to respond_to(:contacts)
    end
  end

  describe 'class_methods' do
    it '.top_interests' do
      company_1 = Company.create!(name: 'Parasites Inc.')
      company_2 = Company.create!(name: 'Berried Alive')
      company_3 = Company.create!(name: 'Space Lounge')
      company_4 = Company.create!(name: 'Plz dont show up')
      Job.create!(title: 'Engineer',
                  level_of_interest: 90,
                  city: 'Denver',
                  company: company_1,
                  description: 'Good Job')
      Job.create!(title: 'Engineer',
                  level_of_interest: 80,
                  city: 'Denver',
                  company: company_2,
                  description: 'Good Job')
      Job.create!(title: 'Engineer',
                  level_of_interest: 70,
                  city: 'Denver',
                  company: company_3,
                  description: 'Good Job')
      Job.create!(title: 'Engineer',
                  level_of_interest: 3,
                  city: 'Denver',
                  company: company_4,
                  description: 'Good Job')

      expect(Company.top_interests).to eq([company_1, company_2, company_3])
    end
  end

  describe 'instance methods' do
    it '.average_interest' do
      company = Company.create!(name: 'Parasites Inc.')
      Job.create!(title: 'Engineer',
                  level_of_interest: 90,
                  city: 'Denver',
                  company: company,
                  description: 'Good Job')
      Job.create!(title: 'Engineer',
                  level_of_interest: 100,
                  city: 'Denver',
                  company: company,
                  description: 'Good Job')

      expect(company.average_interest).to eq(95)
    end
  end
end
