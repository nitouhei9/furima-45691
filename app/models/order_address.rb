class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :shipping_region_id, :city, :street, :building, :phone_number, :token

  # バリデーション
  validates :user_id, :item_id, :postal_code, :shipping_region_id, :city, :street, :phone_number, :token, presence: true
  validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
  validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'is too short or too long' }
  validates :shipping_region_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    # 購入情報をordersテーブルに、配送先をaddressesテーブルに保存する
    order = Order.create(user_id: user_id, item_id: item_id)
    # 配送先の保存
    Address.create(postal_code: postal_code, shipping_region_id: shipping_region_id, city: city, street: street, building: building, phone_number: phone_number, order_id: order.id)
  end
end