class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index]

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
  end

  def edit
  end

  def update
  end

  def show
  end

  private

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
  def item_params
    params.require(:item).permit(:image, :name, :explain, :category_id, :status_id, :shipping_charge_id, :shipping_area_id, :shipping_duration_id, :price).merge(user_id: current_user.id)
  end
end
