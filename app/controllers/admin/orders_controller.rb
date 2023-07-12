class Admin::OrdersController < ApplicationController
  def show
    @orders = order.find(params[:id])
  end
end
