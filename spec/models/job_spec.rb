require 'rails_helper'

describe Job do
  describe 'validations' do
    context 'invalid attributes' do
      it 'is invalid without a title' do
        job = Job.new(level_of_interest: 80,
                      description: 'Wahoo',
                      city: 'Denver')

        expect(job).to be_invalid
      end

      it 'is invalid without a level of interest' do
        job = Job.new(title: 'Developer',
                      description: 'Wahoo',
                      city: 'Denver')

        expect(job).to be_invalid
      end

      it 'is invalid without a city' do
        job = Job.new(title: 'Developer',
                      description: 'Wahoo',
                      level_of_interest: 80)

        expect(job).to be_invalid
      end
    end

    context 'valid attributes' do
      it 'is valid with a title, level of interest, and company' do
        company = Company.new(name: 'Turing')
        job = Job.new(title: 'Developer',
                      level_of_interest: 40,
                      city: 'Denver',
                      company: company)

        expect(job).to be_valid
      end
    end
  end

  describe 'relationships' do
    it 'belongs to a company' do
      job = Job.new(title: 'Software',
                    level_of_interest: 70,
                    city: 'Denver',
                    description: 'Wahooo')

      expect(job).to respond_to(:company)
    end

    it 'belongs to category' do
      job = Job.new(title: 'Software',
                    level_of_interest: 31,
                    city: 'Denver',
                    description: 'Buggers')

      expect(job).to respond_to(:category)
    end

    it 'has many comments' do
      job = Job.new(title: 'Software',
                    level_of_interest: 31,
                    city: 'Denver',
                    description: 'Buggers')

      expect(job).to respond_to(:comments)
    end
  end

  describe 'dependencies' do
    it 'disappears with company' do
      company = Company.create(name: 'Parasite Inc.')
      Job.create(title: 'Software',
                 level_of_interest: 31,
                 city: 'Denver',
                 description: 'Buggers',
                 company: company)

      expect(Job.all.size).to eq(1)

      company.destroy

      expect(Job.all.size).to eq(0)
    end

    it 'disappears with category' do
      company = Company.create(name: 'Parasite Inc.')
      category = Category.create(name: 'Clever')
      Job.create(title: 'Software',
                 level_of_interest: 31,
                 city: 'Denver',
                 company: company,
                 description: 'Buggers',
                 category: category)

      expect(Job.all.size).to eq(1)

      category.destroy

      expect(Job.all.size).to eq(0)
    end
  end

  describe 'class methods' do
    describe '.group_location' do
      it 'returns an array of location cities with the number of jobs it has' do
        company = Company.create(name: 'Parasites Inc.')
        category = Category.create!(name: 'Test')
        Job.create(title: 'Software',
                   level_of_interest: 31,
                   city: 'Denver',
                   company: company,
                   description: 'Buggers',
                   category: category)
        Job.create(title: 'Software',
                   level_of_interest: 31,
                   city: 'Denver',
                   company: company,
                   description: 'Buggers',
                   category: category)
        Job.create(title: 'Software',
                   level_of_interest: 31,
                   city: 'Denver',
                   company: company,
                   description: 'Buggers',
                   category: category)
        Job.create(title: 'Software',
                   level_of_interest: 31,
                   city: 'Colorado Springs',
                   company: company,
                   description: 'Buggers',
                   category: category)


        expect(Job.group_location).to eq([['Colorado Springs', 1], ['Denver', 3]])
      end
    end

    describe '.group_interests' do
      it 'returns jobs grouped by interest' do
        company = Company.create(name: 'Parasites Inc.')
        category = Category.create!(name: 'Test')
        job_1 = Job.create(title: 'Software',
                           level_of_interest: 31,
                           city: 'Denver',
                           company: company,
                           description: 'Buggers',
                           category: category)
        job_2 = Job.create(title: 'Software',
                           level_of_interest: 31,
                           city: 'Denver',
                           company: company,
                           description: 'Buggers',
                           category: category)
        job_3 = Job.create(title: 'Software',
                           level_of_interest: 31,
                           city: 'Denver',
                           company: company,
                           description: 'Buggers',
                           category: category)
        job_4 = Job.create(title: 'Software',
                           level_of_interest: 90,
                           city: 'Colorado Springs',
                           company: company,
                           description: 'Buggers',
                           category: category)

        expect(Job.group_interests).to eq([[], [job_1, job_2, job_3], [], [], [job_4]])
      end
    end
  end
end
