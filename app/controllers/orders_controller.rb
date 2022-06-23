class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @item = Item.find(params[:item_id])
    @order_delivery_address = OrderDeliveryAddress.new
  end

  def create
    @order_delivery_address = OrderDeliveryAddress.new(order_params)
    if@order_delivery_address.valid?
      @order_delivery_address.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.permit( :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number, :item_id)
          .merge(user_id: current_user.id)
  end

end