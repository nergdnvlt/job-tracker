require 'rails_helper'

describe Contact do
  describe 'validations' do
    context 'invalid attributes - name' do
      it 'is invalid without a name' do
        contact = Contact.new(position: 'Manager', email: 'bobrob@gmail.com')
        expect(contact).to be_invalid
      end
    end

    context 'invalid attributes - position' do
      it 'is invalid without a position' do
        contact = Contact.new(name: 'Bob Ross', email: 'bobrob@gmail.com')
        expect(contact).to be_invalid
      end
    end

    context 'invalid attributes - email' do
      it 'is invalid without a email' do
        contact = Contact.new(name: 'Bob Ross', position: 'Manager')
        expect(contact).to be_invalid
      end
    end

    context 'valid attributes' do
      it 'is valid with a name, position, email' do
        contact = Contact.new(name: 'Bob Ross', position: 'Manager', email: 'bobrob@gmail.com')
        expect(contact).to be_valid
      end
    end
  end
end
