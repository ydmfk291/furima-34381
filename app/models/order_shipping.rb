class OrderShipping
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :order_id, :post_cord, :prefecture, :city, :address, :building_name, :tel_number

  with_options presence: true do
    with_options :format, {with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'code Input correctly'} do
      validates :post_cord
    end
    with_options :numericality, { other_than: 0, message: 'Select' } do
      validates :prefecture
    end
    validates :city
    validates :address
    with_options :numericality, { with: /\A[0-9]{11}\z/, message: 'Input only number'} do
      validates :tel_number
    end
  end
end