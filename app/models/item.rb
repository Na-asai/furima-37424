class Item < ApplicationRecord

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_category
  belongs_to :item_sale_sttatus
  belongs_to :item_scheduled_delivery
  belongs_to :item_shipping_fee_status
  belongs_to :prefecture

  validates :item_name, presence: true
  validates :item_text, presence: true


  validates :item_category_id, :item_sale_sttatus_id, :item_scheduled_delivery_id, :item_shipping_fee_status_id, :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}


end
