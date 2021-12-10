class BuysController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @buy = Buy.new
  end
  def create
    @buy = Buy.new(buy_params)
    if @buy.valid?
      pay_item
      @buy.save
      return redirect_to root_path
    else
      render :index
    end
  end
  private
  def buy_params
    params.require(:order).merge(token: params[:token])
  end
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: buy_params[:price]
      card: buyparams[:token],
      currency: 'jpy'
    )
  end
end
