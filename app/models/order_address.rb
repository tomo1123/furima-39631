class OrderAddress
  include ActiveModel::Model

  attr_accessor :postal_code, :prefecture_id, :city, :address_line_1, :building_name, :phone_number, :user_id, :item_id, :token, :price

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :city
    validates :address_line_1
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    address = Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address_line_1: address_line_1, building_name: building_name, phone_number: phone_number, order_id: order.id
    )
  end
end

