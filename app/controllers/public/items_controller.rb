class Public::ItemsController < ApplicationController


  def index
    @items= Item.page(params[:page])#item.allのkaminariバージョン
  end

  def show

  end
end
