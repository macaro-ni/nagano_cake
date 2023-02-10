class Admin::CustomersController < ApplicationController


  def index
    @customers=Customer.page(params[:page])#item.allのkaminariバージョン
  end

  def show
  end

  def edit
  end
end
