require 'rails_helper'

RSpec.describe ProductBuyUserBuySell, type: :model do
  before do
    @product_buy_user_buy_sell = FactoryBot.build(:product_buy_user_buy_sell)
   
  end

  describe '商品購入機能' do
    context '購入できるとき' do
      it '全ての項目があれば購入できる' do
        expect(@product_buy_user_buy_sell).to be_valid
      end
    end

    context '購入できないとき' do
      it 'postal_codeが空では購入できない' do
        @product_buy_user_buy_sell.postal_code = ""
        @product_buy_user_buy_sell.valid?
        expect(@product_buy_user_buy_sell.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeが3桁ハイフン4桁でなければ購入できない' do
        @product_buy_user_buy_sell.postal_code = "1111111"
        @product_buy_user_buy_sell.valid?
        expect(@product_buy_user_buy_sell.errors.full_messages).to include("Postal code is invalid. Enter it as follows (e.g. 123-4567)")
      end

      it 'prefectureが空では出品できない' do
        @product_buy_user_buy_sell.prefecture_id = nil
        @product_buy_user_buy_sell.valid?
        expect(@product_buy_user_buy_sell.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'municipalitiesが空では購入できない' do
        @product_buy_user_buy_sell.municipalities = ""
        @product_buy_user_buy_sell.valid?
        expect(@product_buy_user_buy_sell.errors.full_messages).to include("Municipalities can't be blank")
      end

      it 'addressが空では購入できない' do
        @product_buy_user_buy_sell.address = ""
        @product_buy_user_buy_sell.valid?
        expect(@product_buy_user_buy_sell.errors.full_messages).to include("Address can't be blank")
      end

      it 'telephone_numberが空では購入できない' do
        @product_buy_user_buy_sell.telephone_number = ""
        @product_buy_user_buy_sell.valid?
        expect(@product_buy_user_buy_sell.errors.full_messages).to include("Telephone number can't be blank")
      end

      it 'telephone_numberが半角数値のみでなければでは購入できない' do
        @product_buy_user_buy_sell.telephone_number = "090-1111-11"
        @product_buy_user_buy_sell.valid?
        expect(@product_buy_user_buy_sell.errors.full_messages).to include("Telephone number is invalid. Input only number")
        
      end

      it 'telephone_numberが9桁以下では購入できない' do
        @product_buy_user_buy_sell.telephone_number = "090111111"
        @product_buy_user_buy_sell.valid?
        expect(@product_buy_user_buy_sell.errors.full_messages).to include("Telephone number is too short")
      end

      it 'user_idが空では購入できない' do
        @product_buy_user_buy_sell.user_id = nil
        @product_buy_user_buy_sell.valid?
        expect(@product_buy_user_buy_sell.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空では購入できない' do
        @product_buy_user_buy_sell.item_id = nil
        @product_buy_user_buy_sell.valid?
        expect(@product_buy_user_buy_sell.errors.full_messages).to include("Item can't be blank")
      end

      it 'tokenが空では購入できない' do
        @product_buy_user_buy_sell.token = nil
        @product_buy_user_buy_sell.valid?
        expect(@product_buy_user_buy_sell.errors.full_messages).to include("Token can't be blank")
      end



     

    end
  end
end