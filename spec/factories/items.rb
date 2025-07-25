FactoryBot.define do
  factory :item do
    name                  { Faker::Commerce.product_name }
    description           { Faker::Lorem.sentence }
    category_id           { 2 }
    status_id             { 2 }
    shipping_fee_payer_id { 2 } 
    shipping_region_id    { 2 }
    shipping_day_id       { 2 }
    price                 { Faker::Number.between(from: 300, to: 9_999_999) }
    association :user

    after(:build) do |item|
      item.image.attach(io: StringIO.new("dummy"), filename: 'test_image.png', content_type: 'image/png')
    end
  end
end