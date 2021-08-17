class Item < ApplicationRecord
  #association
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :day_to_ship

  #validation
  with_options presence: true do
    validates :image
    validates :product_name
    validates :description
    validates :price
  end
  validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
 
  with_options presence: true, numericality: { other_than: 1 , message: "can't be blank"} do
    validates :category_id
    validates :condition_id
    validates :day_to_ship_id
    validates :delivery_fee_id
    validates :prefecture_id
  end
end
