FactoryBot.define do
  factory :user do
    user_check_id {1}
    nickname {Faker::Name.name}
    email {Faker::Internet.free_email}
    password = '1a' + Faker::Internet.password(min_length:6)
    password {password}
    password_confirmation {password}
    last_name {"山田"}
    first_name {"太郎"}
    last_name_kana {"ヤマダ"}
    first_name_kana {"タロウ"}
    birthday {Faker::Date.backward}
    telephone {'09012345678'}
  end
end