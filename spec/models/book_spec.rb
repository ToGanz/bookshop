require 'rails_helper'

RSpec.describe Book, type: :model do
  subject { book = Book.create(name: "Red Rising", price: "12.99") }

  context 'all required fields are present' do
    it 'is valid' do
      expect(subject).to be_valid
    end
  end

  context 'name is missing' do
    it 'is not valid' do
      subject.update(name: '')
      expect(subject.errors).to have_key(:name)
    end
  end

  context 'name is not unique' do
    before { Book.create(name: "Red Rising", price: "12.99")}
    subject { Book.create(name: "Red Rising", price: "12.99") }

    it 'is not valid' do
      expect(subject.errors[:name]).to include('has already been taken')
    end
  end

  context 'price is missing' do
    it 'is not valid' do
      subject.update(price: nil)
      expect(subject.errors).to have_key(:price)
    end
  end

  context 'price is not numerical' do
    it 'is not valid' do
      subject.update(price: 'dad')
      expect(subject).to_not be_valid
    end
  end
end
