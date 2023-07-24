class Admin::ItemsController < ApplicationController
  def index 
    @items = Item.page(params[:page])
  end
  def new
    @items = Item.new
  end 
  def create
    @items = Item.new(item_params)
    
    if @items.save
      redirect_to admin_item_path
    end 
  end
  def show
    @item = item.find(params[:id])
  end 
  def edit
    @item = item.find(params[:id])
  end 
  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end 
  
    
  private
   
  def item_params
    params.require(:item).permit(:name, :introduction, :price, :image)
  end 
end
