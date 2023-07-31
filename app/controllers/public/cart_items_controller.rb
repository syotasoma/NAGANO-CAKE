class Public::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.all
    @sum = 0
  end 
  
  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
   if @cart_item.save
    redirect_to cart_items_path
    # 1. 追加した商品がカート内に存在するかの判別
    #存在した場合
    #  2. カート内の個数をフォームから送られた個数分追加する
    #存在しなかった場合
    #  カートモデルにレコードを新規作成する
   end  
  end
  
  def update
    @cart_item = CartItem.find([:id])
    @cart_item.update(curt_item_params)
    redirect_to cart_items_path
  end 
  
  def destroy
   @items = item.find(params[:id])
   item.destroy
   redirect_to "/cart_items"
  end
  
  def all_destroy
     @cart_items = CartItem.all
  end
  
  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end 
end
