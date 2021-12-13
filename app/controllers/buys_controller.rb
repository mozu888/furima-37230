class BuysController < ApplicationController
  before_action :set_buy, only: [:index, :create]
  before_action :authenticate_user!, only: :index
  before_action :move_to_index, only: :index
  def index
    @buy_delivery = BuyDelivery.new
  end

  def create
    @buy_delivery = BuyDelivery.new(buy_params)
    if @buy_delivery.valid?
      pay_item
      @buy_delivery.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def buy_params
    params.require(:buy_delivery).permit(:token, :postal_code, :prefecture_id, :municipality, :address, :building, :call_number)
      .merge(token: params[:token], user_id: current_user.id, item_id: @item.id
    )
  end

  def set_buy
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: buy_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_index
    redirect_to root_path if current_user.id == @item.user_id || @item.buy.id
  end
end
