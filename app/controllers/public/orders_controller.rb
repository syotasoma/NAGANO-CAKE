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
  end
  
  def create
    @item = Order.new(order_params)
    @order = @item.order.new(order_params)
    @order.save
    redirect_to items_path
  end 
  def order_params
    params.require(:order).permit(:name, :payment_method, :payment_amount, :postage, :postalcode, :address)
  end 
end
