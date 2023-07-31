class Public::CustomersController < ApplicationController
    def show
        @customer = current_customer
    end 
    def edit
        @customer = current_customer
    end 
    def update
        @customer = current_customer
    if @customer.update(customer_params)
        redirect_to customer_path(@customer.id)
    else
        render :edit
    end 
    end 
    def unsubscribe
      
    end
    def withdrawal
        @customer = current_customer
        @customer.update(is_deleted: true)
        reset_session
        redirect_to root_path
    end 
private
 def customer_params
    params.require(:customer).permit(:last_name,:first_name,:postal_code,:address,:last_name_kana,:first_name_kana,:telephone_number,:email,:is_deleted)
 end 
end 

