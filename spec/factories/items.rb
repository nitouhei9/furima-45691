FactoryBot.define do
  factory :item do
    name { "MyString" }
    description { "MyText" }
    category_id { 1 }
    price { 1 }
    shipping_fee_payer_id { 1 }
    shipping_region_id { 1 }
    shipping_day_id { 1 }
    status_id { 1 }
    user { nil }
  end
end
