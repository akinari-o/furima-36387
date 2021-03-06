class ProductBuyUserBuySell
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipalities, :address, :building_name, :telephone_number, :user_id, :item_id,
                :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Enter it as follows (e.g. 123-4567)' }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :municipalities
    validates :address
    validates :telephone_number, format: { with: /\A[0-9]+\z/, message: 'is invalid. Input only number' }
    validates :telephone_number, format: { with: /\A[0-9]{10,11}\z/, message: 'is invalid. 10or11 digit' }
    validates :user_id
    validates :item_id
    validates :token
  end

  def save
    user_buy_sell = UserBuySell.create(user_id: user_id, item_id: item_id)

    ProductBuy.create(postal_code: postal_code, prefecture_id: prefecture_id, municipalities: municipalities, address: address,
                      building_name: building_name, telephone_number: telephone_number, user_buy_sell_id: user_buy_sell.id)
  end
end
