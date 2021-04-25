class Book < ApplicationRecord
  monetize :price_cents, allow_nil: true

  has_many :authorships
  has_many :authors, through: :authorships
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true
end
