FactoryBot.define do
  factory :like do
    id {1}
    user_id {5}
    item_id {5}

    association :user
    association :item
  end
end
