FactoryBot.define do
  factory :line_item do
    order
    book
    quantity { 1 }
    each_price_cents { 1 }
  end
end
