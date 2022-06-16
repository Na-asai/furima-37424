class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index]


def index
end


def new
  @item = Item.new(item_params)
end

private

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end


  def item_params
    params.require(:item).permit(:image).merge(user_id: current_user.id)
  end
end

