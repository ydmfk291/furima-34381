FactoryBot.define do
  factory :order_shipping do
    post_code {'123-1234'}
    prefecture_id {1}
    city {'千代田区'}
    address {'1-23-45'}
    building_name {'マルノウチコウ'}
    tel_number {'09012345678'}
  end
end