class Item < ApplicationRecord
  #association
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :condition
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :delivery_fee
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :day_to_ship

  #validation
  validates :image, presence: true
  validates :product_name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300}
  validates :price, numericality: {only_integer: true, less_than_or_equal_to: 9999999}
  # validates :price, format: { with: /^[0-9]+$/}
  
  #ジャンルの選択が「--」の時は保存できないようにする
  with_options presence: true, numericality: { other_than: 1 , message: "can't be blank"} do
    validates :category_id
    validates :condition_id
    validates :day_to_ship_id
    validates :delivery_fee_id
    validates :prefecture_id
  end
end
