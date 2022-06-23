require 'rails_helper'

RSpec.describe OrderDeliveryAddress, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_delivery_address = FactoryBot.build(:order_delivery_address, user_id: user.id, item_id: item.id)
    end

    context '商品を購入できるとき' do
      it 'すべての必要なデータが存在すれば登録できる' do
        expect(@order_delivery_address).to be_valid
      end
    end

    context '商品が購入できないとき' do
      it 'card_numberが空だと登録できない' do
      end
      it 'card_exp_monthが空では登録できない' do
      end
      it 'card_exp_monthが空では登録できない' do
      end
      it 'card_cvcが空だと登録できない' do
      end
      it 'postal_codeが空だと登録できない' do
      end
      it 'prefecture_idが空だと登録できない' do
      end
      it 'cityが空だと登録できない' do
      end
      it 'addressesが空だと登録できない' do
      end
      it 'tokenが生成されていないと登録できない' do
      end
      it 'ユーザーが紐付いていなければ購入できない' do
      end
      it 'itemが紐付いていなければ購入できない' do
      end
    end
  end
end
