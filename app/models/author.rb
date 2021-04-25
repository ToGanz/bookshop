class Author < ApplicationRecord
  # has_many :authorships
  # has_many :books, through: :authorships

  validates :name, presence: true, uniqueness: true

  def to_s
    name
  end
end
