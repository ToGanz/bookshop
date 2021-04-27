require 'rails_helper'

RSpec.describe Order, type: :model do
  subject { Order.create(customer_email: 'test@example.com')}

  context 'all required fields are present' do
    it 'is valid' do
      expect(subject).to be_valid
    end
  end

  context 'email is missing' do
    it 'is not valid' do
      subject.update(customer_email: '')
      expect(subject.errors).to have_key(:customer_email)
    end
  end
end
