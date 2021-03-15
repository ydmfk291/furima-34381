class OrdersController < ApplicationController
  def index
    @order_shipping = OrderShipping.new
  end
end