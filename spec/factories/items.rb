FactoryBot.define do
  factory :item do
    name { Faker::Lorem.word }
    explain { Faker::Lorem.sentence }
    category_id { Faker::Number.between(from: 2, to: 11) }
    status_id { Faker::Number.between(from: 2, to: 11) }
    shipping_charge_id { Faker::Number.between(from: 2, to: 11) }
    shipping_area_id { Faker::Number.between(from: 2, to: 11) }
    shipping_duration_id { Faker::Number.between(from: 2, to: 11) }
    price { Faker::Number.between(from: 300, to: 9_999_999) }
    association :user
    # image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'public/images/simpson.png')) }
    before(:create) do |item|
      item.image.attach(io: File.open('public/images/simpson.png'), filename: 'simpson.png', content_type: 'image/png')
    end
  end

end
