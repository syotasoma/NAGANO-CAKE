class Admin::HomesController < ApplicationController
def index
  @orders = Order..page(params[:page])
end 
end
