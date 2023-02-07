class Public::ItemsController < ApplicationController


  def index
    @items= Item.page(params[:page])#item.allのkaminariバージョン
  end

  def show
    @item= Item.find(params[:id])
    @order_details=OrderDetail.new
  end
end
