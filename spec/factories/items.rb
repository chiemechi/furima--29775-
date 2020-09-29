FactoryBot.define do
  factory :item do
    name            { 'ああ' }
    description     { 'あああああああ' }
    price              { 1111 }
    category_id { 2 }
    condition_id            { 2 }
    charges_id              { 2 }
    area_id       { 2 }
    send_date_id       { 2 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
 
  end
end


