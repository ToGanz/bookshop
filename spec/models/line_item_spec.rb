require 'rails_helper'

RSpec.describe LineItem, type: :model do
  subject { FactoryBot.build(:line_item) }

  context 'all required fields are present' do
    it 'is valid' do
      expect(subject).to be_valid
    end
  end

  context 'order is missing' do
    it 'is not valid' do
      subject.update(order: nil)
      expect(subject.errors).to have_key(:order)
    end
  end

  context 'book is missing' do
    it 'is not valid' do
      subject.update(book: nil)
      expect(subject.errors).to have_key(:book)
    end
  end

  context 'book/order combination is not unique' do
    before do
      FactoryBot.create(:line_item, order: subject.order, book: subject.book)
    end

    it 'is not valid' do
      subject.save
      expect(subject.errors[:book]).to include('has already been taken')
    end
  end

end
