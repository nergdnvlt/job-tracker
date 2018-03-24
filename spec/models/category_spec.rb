require 'rails_helper'

describe Category do
  describe 'validations' do
    it 'must have name' do
      category = Category.new()

      expect(category).to_not be_valid
    end
  end

  describe 'relationships' do
    it 'has many jobs' do
      category = Category.new(name: 'Engineering')

      expect(category).to respond_to(:jobs)
    end
  end
end