class Admin::CustomersController < ApplicationController


  def index
    @customers=Customer.page(params[:page])#item.allのkaminariバージョン
  end

  def show
    @customer=Customer.find(params[:id])
  end

  def edit
  end
end
