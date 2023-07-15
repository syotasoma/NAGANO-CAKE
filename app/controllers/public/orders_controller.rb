class Public::OrdersController < ApplicationController
  def new 
    @order = Orders.new
  end 
  
  def show
    @item = Items.find(params[:id])
    @order = @item.order.new
  end 
  
  def confirm
    @item = Order.new(order_params)
  end 
  
  def create
    @item = Order.new(order_params)
    @order = @item.order.new(order_params)
    @order.save
    redirect_to items_path
  end 
  def order_params
    params.require(:item).permit(:name, :introduction, :price)
  end 
end
