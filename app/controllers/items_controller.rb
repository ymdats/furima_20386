class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
    @items = Item.all.includes(:buy)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to item_path(@item.id)
    else
      render :new
    end
  end

  def destroy
    @item = Item.find(params[:id])
    redirect_to action: :index unless current_user.id == @item.user.id
    if @item.destroy
      redirect_to action: :index
    else
      render :show
    end
  end

  def edit
    @item = Item.find(params[:id])
    redirect_to action: :index unless current_user.id == @item.user.id
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      # redirect_to edit_item_path(item.id)
      render :edit
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def item_params
    params.require(:item).permit(:image, :name, :explain, :category_id, :status_id, :shipping_charge_id, :shipping_area_id, :shipping_duration_id, :price).merge(user_id: current_user.id)
  end
end
