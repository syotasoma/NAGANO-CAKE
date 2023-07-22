class Public::ItemsController < ApplicationController
  def index
    @items = item.all
  end
  def show
    @item = Item.find(params[:id])
  end 
  
private
  def item_params
    params.require(:item).permit(:name,:introduction,:price)
  end 
end
