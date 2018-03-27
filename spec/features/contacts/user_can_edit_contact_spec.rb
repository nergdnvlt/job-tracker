require 'rails_helper'

describe 'editing a contact' do
  context 'user visits company page' do
    it 'they can edit a contact' do
      company = Company.create!(name: 'Parasites Inc.')
      contact = Contact.create!(name: 'Rango',
                                email: 'rango@parasites.inc.com',
                                position: 'Sanitation Engineer',
                                company: company)

      visit company_path(company)

      expect(page).to have_content('Rango')
      expect(page).to have_content('rango@parasites.inc.com')
      expect(page).to have_content('Sanitation Engineer')

      find('.edit').click

      expect(current_path).to eq("/companies/#{contact.company.id}/contacts/#{contact.id}/edit")

      fill_in 'contact[name]', with: 'Phinks'
      fill_in 'contact[position]', with: 'Manager'
      fill_in 'contact[email]', with: 'phinks@parasites.inc.com'

      click_on 'Update Contact'

      expect(current_path).to eq(company_path(company))
      expect(page).to have_content('Phinks')
      expect(page).to have_content('phinks@parasites.inc.com')
      expect(page).to have_content('Manager')
    end

    it 'they see a flash message for editing a contact' do
      company = Company.create!(name: 'Parasites Inc.')
      contact = Contact.create!(name: 'Rango',
                                email: 'rango@parasites.inc.com',
                                position: 'Sanitation Engineer',
                                company: company)

      visit company_path(company)

      expect(page).to have_content('Rango')
      expect(page).to have_content('rango@parasites.inc.com')
      expect(page).to have_content('Sanitation Engineer')

      find('.edit').click

      expect(current_path).to eq("/companies/#{contact.company.id}/contacts/#{contact.id}/edit")

      fill_in 'contact[name]', with: 'Phinks'
      fill_in 'contact[position]', with: 'Manager'
      fill_in 'contact[email]', with: 'phinks@parasites.inc.com'

      click_on 'Update Contact'

      expect(page).to have_content('Contact Phinks Updated!')
    end
  end
end
