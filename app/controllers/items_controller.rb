class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index]

  def index
  end

  def new
  end

  def create
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
end
