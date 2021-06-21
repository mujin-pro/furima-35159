FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    nickname                { Faker::Name.initials(number: 2) }
    email                   { Faker::Internet.free_email }
    password                { Faker::Internet.password(min_length: 6) }
    password_confirmation   { password }
    family_name             { person.last.kanji }
    first_name              { person.first.kanji }
    family_name_furigana    { person.last.katakana }
    first_name_furigana     { person.first.katakana }
    birth_day               { Faker::Date.birthday }
  end
end
