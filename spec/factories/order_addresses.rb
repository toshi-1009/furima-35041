FactoryBot.define do
  factory :order_address do
    postal_code { '123-4567' }
    shipping_area_id  { 2 }
    municipalities  { 'つくば市' }
    address { '123' }
    building_name { 'a' }
    phone_number { '09011111111' }
    user_id { 1 }
    item_id { 1 }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
