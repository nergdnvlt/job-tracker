require 'rails_helper'

describe Category do
  describe 'validations' do
    it 'must have name' do
      category = Category.new()

      expect(category).to_not be_valid
    end
  end
end