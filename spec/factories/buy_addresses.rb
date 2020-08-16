FactoryBot.define do
  factory :buy_address do
    postal_code { '674-0051' }
    prefecture_id { '29' }
    city { '明石市' }
    house_number { '大久保町大窪3254' }
    building_name { 'クリスタルヴィラ' }
    phone_number { '09034702818' }
    # association :buy
  end
end