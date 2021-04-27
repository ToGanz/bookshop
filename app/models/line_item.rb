class LineItem < ApplicationRecord
  belongs_to :order
  belongs_to :book
  validates :book, uniqueness: { scope: :order }
end
