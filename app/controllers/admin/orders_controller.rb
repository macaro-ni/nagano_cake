class Admin::OrdersController < ApplicationController
  def show
     @customer=Customer.find(params[:id])
     @orders=@customer.order.page(params[:page])#item.allのkaminariバージョン

  end
end
