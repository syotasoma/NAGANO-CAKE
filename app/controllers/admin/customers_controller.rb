class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end 
  
  def show
    @customers = Customer.find(params[:id])
  end
  
  def edit
    @customers = Customer.find(params[:id])
  end
  
  def update
    @customers = Customer.find(params[:id])
    if @customer.update(customer.params)
      redirect_to customer_path(@customer.id)
    else
      render :edit
　  end
　 end 
 
  private
  
  def customer_params
    params.require(:customer).permit(:last_name,:first_name,:customer_id,:paymen_method,:payment_amount,:postage,:postal_code,:address,)
  end 
end 

