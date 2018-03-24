require 'rails_helper'

describe Contact do

  before(:each) do
    @company = Company.new(name: 'Parasite Inc.')
  end

  describe 'validations' do
    context 'invalid attributes - name' do
      it 'is invalid without a name' do
        contact = Contact.new(position: 'Manager',
                              email: 'bobrob@gmail.com',
                              company: @company)

        expect(contact).to be_invalid
      end
    end

    context 'invalid attributes - position' do
      it 'is invalid without a position' do
        contact = Contact.new(name: 'Bob Ross',
                              email: 'bobrob@gmail.com',
                              company: @company)

        expect(contact).to be_invalid
      end
    end

    context 'invalid attributes - email' do
      it 'is invalid without a email' do
        contact = Contact.new(name: 'Bob Ross',
                              position: 'Manager',
                              company: @company)

        expect(contact).to be_invalid
      end
    end

    context 'valid attributes' do
      it 'is valid with a name, position, email' do
        contact = Contact.new(name: 'Bob Ross',
                              position: 'Manager',
                              email: 'bobrob@gmail.com',
                              company: @company)

        expect(contact).to be_valid
      end
    end
  end

  describe 'relationships' do
    it 'has a company' do
      contact = Contact.new(name: 'Bob Ross',
                            position: 'Manager',
                            email: 'bobrob@gmail.com',
                            company: @company)

      expect(contact).to respond_to(:company)
    end
  end

  describe 'dependencies' do
    it 'disappears with company' do
      Contact.create(name: 'Bob Ross',
                     position: 'Manager',
                     email: 'bobrob@gmail.com',
                     company: @company)

      expect(Contact.all.size).to eq(1)

      @company.destroy

      expect(Contact.all.size).to eq(0)
    end
  end
end
