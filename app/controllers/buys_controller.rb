class BuysController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :move_to_index, only: [:index]

  def index
  end

  def create
    buy = BuyAddress.new(buy_params)
    if buy.valid?
      pay_item
      buy.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def move_to_index
    if user_signed_in?
      redirect_to controller: :items, action: :index if current_user.id == @item.user.id || @item.buy.present?
    elsif redirect_to new_user_session_path
    end
  end

  def buy_params
    params.permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :token).merge(user_id: @item.user_id, item_id: @item.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: buy_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
