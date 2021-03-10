class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
  end

  def new
    current_item.update(item_params)
  end

  def item_params
    params.require(:item).permit(:image)
    redirect_to root_path
    render :new
  end
end
