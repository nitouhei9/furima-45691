FactoryBot.define do
  factory :address do
    postal_code { "MyString" }
    shipping_region_id { 1 }
    city { "MyString" }
    street { "MyString" }
    building { "MyString" }
    phone_number { "MyString" }
    order { nil }
  end
end
