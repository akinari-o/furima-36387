class ProductBuysController < ApplicationController
   before_action :authenticate_user!, only: [:index, :create]
   before_action :set_buy, only: [:index, :create]
   before_action :limit_buy, only: [:index, :create] 
   before_action :self_buy, only: [:index, :create] 
  def index
   @product_buy_user_buy_sell = ProductBuyUserBuySell.new
  end
 def create

 @product_buy_user_buy_sell = ProductBuyUserBuySell.new(product_buy_user_buy_sell_params)

 if @product_buy_user_buy_sell.valid?
  @product_buy_user_buy_sell.save
  pay_item
  redirect_to root_path
 else
 render :index
 end
 end
  private

 def product_buy_user_buy_sell_params
   params.require(:product_buy_user_buy_sell).permit(:postal_code, :prefecture_id, :municipalities, :address, :building_name, :telephone_number).merge(user_id: current_user.id,item_id: @item.id,token: params[:token])
 end  
 def set_buy
   @item = Item.find(params[:item_id])
 end
 def limit_buy
   if @item.user_buy_sell.present? 
      redirect_to root_path
   end
 end
 def self_buy
   if current_user == @item.user
      redirect_to root_path
   end
 end
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  
    Payjp::Charge.create(
    amount: @item.price,  
    card: product_buy_user_buy_sell_params[:token],    
    currency: 'jpy'                 
    )
  end

end
