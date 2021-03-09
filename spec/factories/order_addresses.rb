FactoryBot.define do
  factory :order_address do
    postal_code {'123-4567'}
    prefecture_id {1}
    city {'渋谷区'}
    house_number{'1-1'}
    house_name{'渋谷ハウス101'}
    telephone {'09012345678'}
    token {'tok_abcdefghijk00000000000000000'}
  end
end
