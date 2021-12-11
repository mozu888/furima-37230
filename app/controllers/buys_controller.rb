class BuysController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @buy_delivery = BuyDelivery.new
  end
  def create
    @item = Item.find(params[:item_id])
    @buy_delivery = BuyDelivery.new(buy_params)
    if @buy_delivery.valid?
      pay_item
      @buy_delivery.save
      return redirect_to root_path
    else
      render :index
    end
  end
  private
  def buy_params
    params.require(:buy_delivery).permit(:token, :postal_code, :prefecture_id, :municipality, :address, :building, :call_number).merge(token: params[:token], user_id: current_user.id)
  end
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      card: buy_params[:token],
      currency: 'jpy'
    )
  end
end
