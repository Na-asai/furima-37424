require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe "商品出品機能" do
    context '商品が出品できるとき' do
      it 'image,item_name,item_text,item_category,item_sale_status,item_shipping_fee_status,prefecture,item_scheduled_delivery,item_priceが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '商品が出品できないとき' do
      it "imageが空だと登録できない" do
        @item.image = nil
        @item.valid?
      end
      it "item_nameが空では登録できない" do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it 'item_textが空では登録できない' do
        @item.item_text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item text can't be blank")
      end
      it "item_category_idが空だと登録できない" do
        @item.item_category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item category can't be blank")
      end
      it "item_sale_status_idが空だと登録できない" do
        @item.item_sale_status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item sale status can't be blank")
      end
      it "item_shipping_fee_status_idが空だと登録できない" do
        @item.item_shipping_fee_status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item shipping fee status can't be blank")
      end
      it "prefecture_idが空だと登録できない" do
        @item.prefecture = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "item_scheduled_delivery_idが空だと登録できない" do
        @item.item_scheduled_delivery_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item scheduled delivery can't be blank")
      end
      it "item_priceが空だと登録できない" do
        @item.item_price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price can't be blank")
      end
      it "item_priceが299以下だと登録できない" do
        @item.item_price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price must be greater than or equal to 300")
      end
      it "item_priceが空だと登録できない" do
        @item.item_price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price must be less than or equal to 9999999")
      end
      it "item_priceが全角だと登録できない" do
        @item.item_price = "１０_０００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price is not a number")
      end
      it "ユーザーが紐付いていなければ投稿できない" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end

    end
  end




end
