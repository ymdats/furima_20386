FactoryBot.define do
  gimei = Gimei.name
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    family_name           { gimei.last.kanji }
    first_name            { gimei.first.kanji }
    family_kana           { gimei.last.katakana }
    first_kana            { gimei.first.katakana }
    birthday              { Faker::Date.birthday }
  end
end
