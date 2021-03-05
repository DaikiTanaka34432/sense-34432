FactoryBot.define do
  factory :item do
    id {1}
    name {"テスト商品１"}
    profile {"商品説明です（作ったきっかけやデザインなど）"}
    detail {"商品詳細です（サイズや色など）"}
    category_id {1}
    delivery_fee_id {1}
    prefecture_id {1}
    shipment_days_id {1}
    fee {'2980'}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/apple-touch-icon.png'), filename:'apple-touch-icon.png')
    end
  end

end
