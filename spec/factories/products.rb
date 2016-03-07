FactoryGirl.define do
  factory :product do
    name { Faker::Commerce.product_name }
    short_description { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph }
  end
end
