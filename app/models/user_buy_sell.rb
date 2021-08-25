class UserBuySell < ApplicationRecord
 belongs_to :user
 belongs_to :item
 has_one_attached :product_buy
end
