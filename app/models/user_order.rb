class UserOrder

  include ActiveModel::Model
  attr_accessor :postcode, :prefecture, :city, :address, :building_name, :tellphone, :item_id, :user_id, :token


  with_options presence: true do
    validates :postcode,  format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :prefecture, numericality: { other_than: 1 }
    validates :city
    validates :address
    validates :tellphone, format: { with: /\A[0][0-9]{10}\z/ }
    validates :item_id
    validates :user_id
    validates :token
  end


  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(postcode: postcode, prefecture: prefecture, city: city, address: address, building_name:  building_name, tellphone: tellphone, order_id: order.id)
  end
end


