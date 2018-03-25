require 'rails_helper'

describe 'deleting a contact' do
  context 'user visits company page' do
    it 'they can delete a contact' do
      company = Company.create!(name: 'Parasites Inc.')
      contact = Contact.create!(name: 'Rango',
                                email: 'rango@parasites.inc.com',
                                position: 'Sanitation Engineer',
                                company: company)

      visit company_path(company)

      expect(page).to have_content('Rango')
      expect(page).to have_content('rango@parasites.inc.com')
      expect(page).to have_content('Sanitation Engineer')

      click_on 'Delete'

      expect(page).to_not have_content('Rango')
      expect(page).to_not have_content('rango@parasites.inc.com')
      expect(page).to_not have_content('Sanitation Engineer')
    end
  end
end