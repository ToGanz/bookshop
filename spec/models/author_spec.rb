require 'rails_helper'

RSpec.describe Author, type: :model do
  context 'all required fields are present' do
    subject { Author.create(name: 'Tobias Guhns') }
    
    it 'is valid' do
      # expect(subject.valid?).to be true
      expect(subject).to be_valid
    end
  end
 
  context 'name is not present' do
    subject { Author.create(name: '') }

    it 'is not valid' do
      # expect(author.errors.has_key?(:name)).to be true
      expect(subject.errors).to have_key(:name)
    end
  end
  # context 'name is not unique' do 
  #   it 'is not valid' do
  #     other_author = Author.create(name: 'Carl Sagan')
  #     author = Author.create(name: 'Carl Sagan') 
  #     expect(author.errors[:name]).to include('has already been taken')
  #   end 
  # end
  # context 'name is not unique' do 
  #   before { Author.create(name: 'Carl Sagan') }
  #   subject { Author.create(name: 'Carl Sagan') }

  #   it 'is not valid' do
  #     expect(subject.errors[:name]).to include('has already been taken')
  #   end 
  # end
end
