require 'rails_helper'

describe 'user visits nonexistent page' do
  context 'invalid url' do
    it 'should be a 404 page' do
      visit '/barnacles'

      expect(current_path).to eq('/barnacles')
      expect(page.status_code).to eq(404)
    end

    it 'should have the nav bar' do
      visit '/barnacles'

      expect(page).to have_link('Job Main')
      expect(page).to have_link('Companies')
      expect(page).to have_link('Categories')
      expect(page).to have_link('Home')
    end
  end
end
