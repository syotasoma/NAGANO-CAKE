class Public::ItemsController < ApplicationController
  def index
    @items = item.all
  end
  def show
    @item = Item.find(params[:id])
  end 
end
