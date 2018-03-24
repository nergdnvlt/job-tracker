require 'rails_helper'

describe Comment do
  describe 'validations' do
    it 'must have content' do
      comment = Comment.new()

      expect(comment).to_not be_valid
    end
  end
end