class OrderAddress
  include ActiveModel::Model

  attr_accessor :postal_code, :prefecture_id, :city, :address_line_1, :building_name, :phone_number, :user_id, :item_id, :token, :price

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :city, presence: true
    validates :address_line_1, presence: true
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
    validates :token, presence: true
  end

  validates :building_name, presence: true, allow_blank: true

  def save
    order = Order.create(user_id: user_id, item_id: item_id, price: price, token: token)
    address = Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address_line_1: address_line_1, building_name: building_name, phone_number: phone_number, order_id: order.id
    )
  end
end

