class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @item = Item.find(params[:item_id])
    @order_delivery_address = OrderDeliveryAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_delivery_address = OrderDeliveryAddress.new(order_params)
    binding.pry
    if  @order_delivery_address.valid?
      @order_delivery_address.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.require(:order_delivery_address).permit(:card_number, :card_exp_month, :card_exp_year, :card_cvc, :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number, :item_id)
          .merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

end