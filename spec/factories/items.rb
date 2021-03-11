FactoryBot.define do
  factory :item do
    name { 'テスト商品名前' }
    text { '商品の説明をします' }
    price { 1000 }
    category_id { 1 }
    condition_id { 1 }
    postage_id { 1 }
    prefecture_id { 1 }
    delivery_id { 1 }
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
