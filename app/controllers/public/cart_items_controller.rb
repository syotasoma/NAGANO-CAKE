class Public::CartItemsController < ApplicationController
  def index
    @cart_items = Cart_item.all
  end 
  
  def create
    @cart_items = Cart_item.new(cart_item_params)
    @cart_item.customer_id == current_customer
  end
  
  def update
  end 
  
  def destroy
  end
  
  def all destroy
  end
end
