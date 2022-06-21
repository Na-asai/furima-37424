class OrderDeliveryAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number, :item_id, :user_id

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :addresses
    validates :phone_number, format: {with /\A[0-9]{10,11}\z/}
  end
  validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}
  
  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    # donation_idには、変数donationのidと指定する
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, addresses: addresses, building: building, phone_number: phone_number,order: order.id)
  end
end