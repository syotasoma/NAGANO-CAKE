class Admin::HomesController < ApplicationController
def index
  @items = Item.all
  
end
