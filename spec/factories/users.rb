FactoryBot.define do
  factory :user do
    nickname                {'test'}
    email                   {'test@example'}
    password                {'000000'}
    password_confirmation   {'000000'}
    family_name             {'山田'}
    first_name              {'太郎'}
    family_name_furigana    {'ヤマダ'}
    first_name_furigana     {'タロウ'}
    birth_day               {'2000/01/01'}
  end
end