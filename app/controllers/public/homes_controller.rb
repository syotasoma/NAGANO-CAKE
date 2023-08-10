class Public::HomesController < ApplicationController
  def top
    @item = Item.all
  end
  def about
  end
    
private
  def item_params
    params.require(:item).permit(:name,:price,:item_image)
  end 
end