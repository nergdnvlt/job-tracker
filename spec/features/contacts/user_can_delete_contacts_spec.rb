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

      expect(page).to have_content(contact.name)
      expect(page).to have_content(contact.email)
      expect(page).to have_content(contact.position)

      find('.delete').click

      expect(page).to_not have_content(contact.name)
      expect(page).to_not have_content(contact.email)
      expect(page).to_not have_content(contact.position)
    end

    it 'they can delete a contact' do
      company = Company.create!(name: 'Parasites Inc.')
      contact = Contact.create!(name: 'Rango',
                                email: 'rango@parasites.inc.com',
                                position: 'Sanitation Engineer',
                                company: company)

      visit company_path(company)

      expect(page).to have_content(contact.name)
      expect(page).to have_content(contact.email)
      expect(page).to have_content(contact.position)

      find('.delete').click

      expect(page).to have_content('Contact Deleted!')
    end
  end
end
