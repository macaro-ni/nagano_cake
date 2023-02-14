class Admin::HomesController < ApplicationController


  def top
    @orders=Order.page(params[:page])#item.allのkaminariバージョン
    
  end
end
