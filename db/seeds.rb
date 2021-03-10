# ユーザー（芸人）
17.times do |n|
User.create(
  user_check_id:1, nickname:"芸人#{n+1}", email: "talent#{n+1}@talent.jp",password: "talent#{n+1}",password_confirmation: "talent#{n+1}",
  last_name:"テスト", first_name:"テスト", last_name_kana:"テスト", first_name_kana:"テスト",
  birthday:"1990-01-01", telephone:"09011112222", office_id:n+1, career:"2011-01-01", introduction:"こんにちは芸人やってます。")
end
# /ユーザー（芸人）
# ユーザー（一般）
3.times do |n|
User.create(
  user_check_id:2, nickname:"一般#{n+1}", email: "ippan#{n+1}@ippan.jp",password: "ippan#{n+1}",password_confirmation: "ippan#{n+1}",
  last_name:"いっぱん", first_name:"てすこ#{n+1}", last_name_kana:"イッパン", first_name_kana:"テスコ",
  birthday:"1990-01-01", telephone:"09011112222", introduction:"〇〇のファンです。")
end
# /ユーザー（一般）


# 商品一覧
50.times do |n|
  id = n +1
  if id > 17
    id = id-17
    puts id
  end
  item =Item.create(
    name:"芸人#{id}の限定商品です",
    profile: "サンプル写真です！サンプル写真です！サンプル写真です！サンプル写真です！サンプル写真です！サンプル写真です！サンプル写真です！サンプル写真です！",
    detail: "サンプル写真です！サンプル写真です！サンプル写真です！サンプル写真です！サンプル写真です！サンプル写真です！サンプル写真です！サンプル写真です！",
    category_id: rand(1..10),
    delivery_fee_id: rand(1..2),
    prefecture_id: rand(1..47),
    shipment_days_id: rand(1..3),
    fee: rand(1..20)*1000,
    user_id: id
  )
  item.image.attach(io: File.open("db/fixtures/sample#{n+1}.jpeg"), filename:"sample#{n+1}.jpeg")
  item.save
end