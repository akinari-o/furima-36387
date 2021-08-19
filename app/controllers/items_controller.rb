class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index
    @items = Item.order("created_at DESC")
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
    @item = Item.find(params[:id])
  end
  def edit
    @item = Item.find(params[:id])
    unless current_user == @item.user
      redirect_to root_path
    end
  end
  def update
      @item = Item.find(params[:id])
      
      if @item.update(item_params)
        redirect_to item_path
      else
        render :edit
      end
  end
  private
  def item_params
    params.require(:item).permit(:image, :product_name, :description, :price, :category_id, :condition_id, :day_to_ship_id, :delivery_fee_id, :prefecture_id).merge(user_id: current_user.id)
  end


end
