class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @item = Item.find(params[:item_id])
    @order_delivery_address = OrderDeliveryAddress.new
  end

  def create

  end

  private

  def order_params
    params.permit( :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number, :item_id).merge(user_id: current_user.id)
    #params.permit(:item_id).merge(user_id: current_user.id)
  end

  #def address_params
    #params.permit( :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number).merge(order_id: @order.id)
  #end
end