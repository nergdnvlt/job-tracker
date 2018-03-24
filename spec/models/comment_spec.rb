require 'rails_helper'

describe Comment do
  describe 'validations' do
    it 'must have content' do
      comment = Comment.new()

      expect(comment).to_not be_valid
    end
  end

  describe 'relationships' do
    it 'belongs to a job' do
      comment = Comment.new(content: 'Blah blah blah')

      expect(comment).to respond_to(:job)
    end
  end

  describe 'dependencies' do
    it 'disappears with job' do
      company = Company.create(name: 'Parasite Inc.')
      job = Job.create(title: 'Software',
                       level_of_interest: 30,
                       city: 'Denver',
                       description: 'Buggers',
                       company: company)
      Comment.create(job: job, content: 'Blah blah')

      expect(Comment.all.size).to eq(1)

      job.destroy

      expect(Comment.all.size).to eq(0)
    end

    it 'disappears with company' do
      company = Company.create(name: 'Parasite Inc.')
      job = Job.create(title: 'Software',
                       level_of_interest: 30,
                       city: 'Denver',
                       description: 'Buggers',
                       company: company)
      Comment.create(job: job, content: 'Blah blah')

      expect(Comment.all.size).to eq(1)

      company.destroy

      expect(Comment.all.size).to eq(0)
    end
  end
end
