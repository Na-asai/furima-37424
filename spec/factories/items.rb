FactoryBot.define do
  factory :item do
    image                       {Faker::Lorem.sentence}
    item_name                   {Faker::Name.initials(number: 6)}
    item_text                   {Faker::Name.initials(number: 6)}
    item_category               {id: 2}
    item_sale_status            {id: 2}
    item_shipping_fee_status    {id: 2}
    prefecture                  {id: 2}
    item_scheduled_delivery     {id: 2}
    item_price                  {'100000'}
  end
end