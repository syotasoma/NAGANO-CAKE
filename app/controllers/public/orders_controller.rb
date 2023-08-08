class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!
  def new 
    @order = Order.new
    @customer = current_customer
  end 
  
  def show
    @order = Order.find(params[:id])
    @sum = 0
  end 
  
  def confirm
    @order = Order.new(order_params)
    @order.postalcode = current_customer.postal_code
    @order.address = current_customer.address
    @order.name = current_customer.last_name+current_customer.first_name
    @order.customer_id = current_customer.id
    @order.postage = 800
    @sum = 0
    @cart_items = CartItem.all
  end 
  
  def index
    @orders = Order.all
  end
  
  def create
    @order = current_customer.orders.new(order_params)
    # @order = Order.new(order_params)
    # @order.customer_id = current_customer.id
    @order.save
    @cart_items = current_customer.cart_items.all
    @cart_items.each do |cart_item|
      @order_item = OrderItem.new
      @order_item.order_id = @order.id
      @order_item.item_id = cart_item.item_id
      @order_item.priceattimeofpurchase = cart_item.item.with_tax_price
      @order_item.amount = cart_item.amount
      @order_item.save
    end

    @order.save
    current_customer.cart_items.destroy_all
    redirect_to complete_path
  end 
  
  def complete
  end
  
  def order_params
    params.require(:order).permit(:name, :payment_method, :payment_amount, :postage, :postalcode, :address)
  end 
end
