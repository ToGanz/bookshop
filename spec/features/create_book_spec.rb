require 'rails_helper'

RSpec.describe :Book, type: :feature do
  before { visit new_book_path }

  scenario 'valid inputs' do
    fill_in 'Name', with: 'Red Rising'
    fill_in 'Price', with: '12.99'
    click_on 'Create Book'
    expect(page).to have_content('Book was successfully created.')
  end

  scenario 'invalid inputs' do
    fill_in 'Name', with: ''
    fill_in 'Price', with: ''
    click_on 'Create Book'
    expect(page).to have_content("Name can't be blank")
    expect(page).to have_content("Price can't be blank")
  end
end