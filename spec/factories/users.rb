FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 6)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Lorem.characters(number: 6, min_alpha: 1,min_numeric: 1)}
    password_confirmation {password}
    last_name             {'やまだ'}
    first_name            {'たろう'}
    last_name_kana        {'ヤマダ'}
    first_name_kana       {'タロウ'}
    birth                 {'1990-01-01'}
  end
end