FactoryBot.define do
  factory :order_address do
    phone_number { '1234567' }
    postal_code { '123-4567' }
    prefecture_id { 1 }
    city { '東京都' }
    house_number { '1-1' }
    building { '東京ハイツ' }
    token { 'tok_abcdefghijk00000000000000000'}
  end
end
