FactoryBot.define do
  factory :user do
    nickname              {Faker::Name}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name
    first_name
    first_kana
    last_kana
    birth_day{Faker::dateTimeBetween}






    
  end
end