FactoryBot.define do
  factory :order_delivery_address do
    card_number         { '4242424242424242' }
    card_exp_month      { '12' }
    card_exp_year       { '30' }
    card_cvc            { '123' }
    postal_code         { '123-4567' }
    prefecture_id       { 2 }
    city                { '名古屋市' }
    addresses           { '愛知県' }
    building            { 'コーポhoge' }
    phone_number        { '09012345678' }
    token               { 'tok_abcdefghijk00000000000000000' }
  end
end
