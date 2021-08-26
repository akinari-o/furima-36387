class UserBuySell < ApplicationRecord
 belongs_to :user
 belongs_to :item
 has_one :product_buy
end
