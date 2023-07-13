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
   @items = item.find(params[:id])
   item.destroy
   redirect_to "/cart_items"
  end
  
  def all destroy
     @cart_items = Cart_item.all
  end
end
