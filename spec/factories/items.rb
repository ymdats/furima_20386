FactoryBot.define do
  factory :item do
    name {Faker::Lorem.word}
    explain {Faker::Lorem.sentence}
    category_id {Faker::Number.between(from: 2, to: 11)}
    status_id {Faker::Number.between(from: 2, to: 11)}
    shipping_charge_id {Faker::Number.between(from: 2, to: 11)}
    shipping_area_id {Faker::Number.between(from: 2, to: 11)}
    shipping_duration_id {Faker::Number.between(from: 2, to: 11)}
    price {Faker::Number.between(from: 300, to: 9999999)}
    association :user 
  end
end
