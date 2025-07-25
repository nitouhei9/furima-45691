class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  # ActiveHashとの関連付け
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_fee_payer
  belongs_to :shipping_region
  belongs_to :shipping_day

  # バリデーション
  validates :name, presence: true
  validates :description, presence: true
  validates :image, presence: true
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :status_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_fee_payer_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_region_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_day_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  # # アソシエーション
  # has_one :order
  
end