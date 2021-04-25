class Order < ApplicationRecord
  validates :customer_email, presence: true
end
