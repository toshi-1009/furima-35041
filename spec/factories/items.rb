FactoryBot.define do
  factory :item do
    product_name             { 'テスト' }
    description              { 'テスト' }
    category_id              { 2 }
    product_state_id          { 2 }
    shipping_charges_id       { 2 }
    shipping_area_id { 2 }
    shipping_day_id           { 2 }
    selling_price             { 500 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.jpg')
    end
  end
end
