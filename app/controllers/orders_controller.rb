class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @item = Item.find(params[:item_id])
    @order_delivery_address = OrderDeliveryAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_delivery_address = OrderDeliveryAddress.new(order_params)
    if  @order_delivery_address.valid?
      pay_item
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

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.item_price, 
      card: order_params[:token],   
      currency: 'jpy'                
    )
  end

end