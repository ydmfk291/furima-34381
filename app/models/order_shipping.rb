class OrderShipping
  include ActiveModel::Model

  with_options presence: true do
    validates :token
    validates :user_id
    validates :item_id
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'Input correctly' }
    validates :prefecture_id, numericality: { other_than: 0, message: 'Select' }
    validates :city
    validates :address
    validates :tel_number, format: { with: /\A\d{10,11}\z/, message: 'Input only number' }
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Shipping.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address,
                               tel_number: tel_number, order_id: order.id)
  end
end