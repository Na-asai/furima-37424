require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order)
  end

  describe '商品購入機能' do
    context '商品を購入できるとき' do
      it 'すべての必要なデータが存在すれば登録できる' do
        expect(@order).to be_valid
      end
    end
    context '商品が購入できないとき' do
      it 'imageが空だと登録できない' do

      end
      it 'item_nameが空では登録できない' do

      end
      it 'item_textが空では登録できない' do

      end
      it 'item_category_idが空だと登録できない' do

      end
      it 'item_category_idが---だと登録できない' do

      end
      it 'item_sale_status_idが空だと登録できない' do

      end
      it 'item_sale_status_idが---だと登録できない' do

      end
      it 'item_shipping_fee_status_idが空だと登録できない' do

      end
      it 'item_shipping_fee_status_idが---だと登録できない' do

      end
      it 'prefecture_idが空だと登録できない' do

      end
      it 'prefecture_idが---だと登録できない' do

      end
      it 'item_scheduled_delivery_idが空だと登録できない' do

      end
      it 'item_scheduled_delivery_idが---だと登録できない' do

      end
      it 'item_priceが空だと登録できない' do

      end
      it 'item_priceが299以下だと登録できない' do

      end
      it 'item_priceが10000000以上だと登録できない' do

      end
      it 'item_priceが全角だと登録できない' do

      end
      it 'ユーザーが紐付いていなければ投稿できない' do

      end
    end
  end
end

