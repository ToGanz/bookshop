require 'rails_helper'

RSpec.describe 'Creating a book', type: :feature do

  scenario 'valid inputs' do
    Author.create!([
      { name: 'Carl Sagan' },
      { name: 'Ann Druyan' }          
    ])
    visit new_book_path 

    fill_in 'Name', with: 'Shadows of Forgotten Ancestors'
    fill_in 'Price', with: '12.99'
    check 'Carl Sagan'
    check 'Ann Druyan'  
    click_on 'Create Book'
    expect(page).to have_content('Book was successfully created.')
    expect(page).to have_content('Carl Sagan')
    expect(page).to have_content('Ann Druyan')  
  end

  scenario 'invalid inputs' do
    visit new_book_path 

    fill_in 'Name', with: ''
    fill_in 'Price', with: ''
    click_on 'Create Book'
    expect(page).to have_content("Name can't be blank")
    expect(page).to have_content("Price can't be blank")
  end
end