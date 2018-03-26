require 'rails_helper'

describe 'creating a contact' do
  context 'user visits company page' do
    it 'they can make a new contact' do
      company = Company.create(name: 'Parasites Inc.')

      visit company_path(company)

      fill_in 'contact[name]', with: 'Rango'
      fill_in 'contact[email]', with: 'rango@parasites.inc.com'
      fill_in 'contact[position]', with: 'Sanitation Engineer'

      click_on 'Create Contact'

      expect(current_path).to eq(company_path(company))
      expect(page).to have_content('Rango')
      expect(page).to have_content('rango@parasites.inc.com')
      expect(page).to have_content('Sanitation Engineer')
    end

    it 'they see a flash message for new contact' do
      company = Company.create(name: 'Parasites Inc.')

      visit company_path(company)

      fill_in 'contact[name]', with: 'Rango'
      fill_in 'contact[email]', with: 'rango@parasites.inc.com'
      fill_in 'contact[position]', with: 'Sanitation Engineer'

      click_on 'Create Contact'

      expect(page).to have_content('Rango Contact Created!')
    end
  end
end
