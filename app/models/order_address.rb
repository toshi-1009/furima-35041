class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :order_id, :postal_code, :shipping_area_id, :municipalities, :address, :building_name,
                :phone_number, :order_id, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'Input correctly' }
    validates :municipalities
    validates :address
    validates :phone_number, format: { with: /\A[0-9]{10,11}\z/, message: 'Input only number' }
    validates :shipping_area_id, numericality: { other_than: 1, message: 'Select' }
    validates :token
  end
  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, shipping_area_id: shipping_area_id, municipalities: municipalities,
                   address: address, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end
