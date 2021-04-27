require 'rails_helper'

RSpec.describe 'Creating an order', type: :feature do 
  scenario 'when books are selected' do
    book_1 = create(:book)
    book_2 = create(:book)

    visit new_order_path
    fill_in 'Customer email', with: 'test@example.com'
    check book_1.name
    check book_2.name
    click_on 'Create Order'

    visit orders_path
    expect(page).to have_content(book_1.name)
    expect(page).to have_content(book_1.name)
  end
end