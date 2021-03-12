class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_index, only: [:edit, :update]
  def index
    @items = Item.order('created_at DESC').includes(:user)
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

  def show
  end

  def edit
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :text, :price, :category_id, :condition_id, :postage_id, :prefecture_id, :delivery_id).merge(user_id: current_user.id)
  end
  
  def move_to_index
    item = Item.find(params[:id])
      redirect_to action: :index
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
