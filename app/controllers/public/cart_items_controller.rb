class Public::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.all
    @sum = 0
  end 
  
  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    # 1. 追加した商品がカート内に存在するかの判別
     if cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id]) 
       #存在した場合
       #  2. カート内の個数をフォームから送られた個数分追加する
       cart_item.amount += params[:cart_item][:amount].to_i
       cart_item.save
       redirect_to cart_items_path
      #存在しなかった場合
    #  カートモデルにレコードを新規作成する
     elsif @cart_item.save
       redirect_to cart_items_path
    
     else
       render 'customer/items/show'
     end 
  end 
       
  
  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end 
  
  def destroy
   cart_item = CartItem.find(params[:id])
   cart_item.destroy
   redirect_to "/cart_items"
  end
  
  def all_destroy
     current_customer.cart_items.destroy_all
     redirect_to "/cart_items"
  end
  
  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end 
end
