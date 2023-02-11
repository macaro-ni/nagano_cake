class Public::ItemsController < ApplicationController


  def index
    @items= Item.page(params[:page])#item.allのkaminariバージョン
  end

  def show
    @item= Item.find(params[:id])
    @order_details=OrderDetail.new
    @cart_item=CartItem.new
  end
  
  # 消費税を求めるメソッド
  def with_tax_price
      (price * 1.1).floor
  end

end
