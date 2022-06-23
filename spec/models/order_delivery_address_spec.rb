require 'rails_helper'

RSpec.describe OrderDeliveryAddress, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_delivery_address = FactoryBot.build(:order_delivery_address, user_id: user.id, item_id: item.id)
      sleep 0.1
    end

    context '商品を購入できるとき' do
      it 'すべての必要なデータが存在すれば登録できる' do
        expect(@order_delivery_address).to be_valid
      end
    end

    context '商品が購入できないとき' do
      it 'postal_codeが空だと登録できない' do
        @order_delivery_address.postal_code = ''
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("Postal code can't be blank")
      end
      sleep 0.1
      it 'postal_codeにハイフンがないと登録できない' do
        @order_delivery_address.postal_code = '12345678'
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'prefecture_idが空だと登録できない' do
        @order_delivery_address.prefecture_id = ''
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefecture_idが---だと登録できない' do
        @order_delivery_address.prefecture_id = '1'
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空だと登録できない' do
          @order_delivery_address.city = ''
          @order_delivery_address.valid?
          expect(@order_delivery_address.errors.full_messages).to include("City can't be blank")
      end
      it 'addressesが空だと登録できない' do
        @order_delivery_address.addresses = ''
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("Addresses can't be blank")
      end
      it 'phone_numberが空だと登録できない' do
        @order_delivery_address.phone_number = ''
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが8桁以下だと登録できない' do
        @order_delivery_address.phone_number = '12345678'
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberが12桁以上だと登録できない' do
        @order_delivery_address.phone_number = '123456789012'
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("Phone number is invalid")
      end
      it 'tokenが生成されていないと登録できない' do
        @order_delivery_address.token = ''
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'ユーザーが紐付いていなければ購入できない' do
        @order_delivery_address.user_id = nil
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていなければ購入できない' do
        @order_delivery_address.item_id = nil
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
