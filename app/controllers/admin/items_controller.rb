class Admin::ItemsController < ApplicationController
  def index
    @items=Items.page(params[:page])
  end

  def new
  end

  def show
  end

  def edit
  end
end
