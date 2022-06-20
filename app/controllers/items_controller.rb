class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  # before_action :move_to_index, except: [:index]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :item_text, :item_category_id, :item_sale_status_id,
                                 :item_scheduled_delivery_id, :item_shipping_fee_status_id, :prefecture_id, :item_price).merge(user_id: current_user.id)
  end

  # def move_to_index
  # redirect_to action: :index unless user_signed_in?
  # end
end
