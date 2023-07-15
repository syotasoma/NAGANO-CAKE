class Public::CustomersController < ApplicationController
    def show
        @custemor == current_customer
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
        @customer = current_customer
        @customer.unsubscribe(customer_params)
        redirect_to show_path
    end
    def withdrawal
        @customer = current_customer
    end 
end 
