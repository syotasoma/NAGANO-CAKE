class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.page(params[:page])
  end 
  
  def show
    @customer = Customer.find(params[:id])
  end
  
  def edit
    @customers = Customer.find(params[:id])
  end
  
  def update
    @customers = Customer.find(params[:id])
    if @customers.update(customer_params)
      redirect_to admin_customer_path(@customers.id)
    else
      render :edit
    end
  end 
 
  private
  
  def customer_params
    params.require(:customer).permit(:last_name,:first_name,:customer_id,:paymen_method,:payment_amount,:postage,:postal_code,:address,:last_name_kana,:first_name_kana,:telephone_number)
  end 
end 

