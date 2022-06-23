FactoryBot.define do
  factory :order do
    card_number                      { 4242424242424242 }
    card_exp_month                   { 12 }
    card_exp_year                    { 30 }
    card_cvc                         { 123 }
    postal_code                      { 123-4567 }
    prefecture_id                    { 2 }
    city                             { '名古屋市' }
    addresses                        { '愛知県' }
    building                         { 'コーポhoge' }

    association :user
    association :item

  end
end
