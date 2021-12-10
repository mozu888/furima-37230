class BuysController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @buy = Buy.new
  end
  def create
    @buy = Buy.new(buy_params)
    if @buy.valid?
      @buy.save
      return redirect_to root_path
    else
      render :index
    end
  end
  private
  def buy_params
    params.require(:order)
  end
end
