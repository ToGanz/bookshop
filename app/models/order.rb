class Order < ApplicationRecord
  validates :customer_email, presence: true
  has_many :line_items
  has_many :books, through: :line_items
end
