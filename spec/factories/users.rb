FactoryBot.define do
  factory :user do
    nickname              {"ああ"}
    email                 {"aaaa@gmail.com"}
    password              {"aaaa1111"}
    password_confirmation  {"aaaa1111"}
    first_name            {"太郎"}
    last_name             {"山田"}
    first_name_kana       {"タロウ"}
    last_name_kana        {"ヤマダ"}
    birth_day             {"2000/01/01"}
  end
end