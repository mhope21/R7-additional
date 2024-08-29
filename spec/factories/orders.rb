FactoryBot.define do
  factory :order do
    product_name { Faker::Lorem.word }
    product_count { Faker::Number.number }
    association :customer
  end
end
