class Admin::ItemsController < ApplicationController
  def index
    @items=Items.page(params[:page])
  end

  def new
    @item=Item.new
  end

  def show
  end

  def edit
    @item=Item.find(params[:id])
  end
end
