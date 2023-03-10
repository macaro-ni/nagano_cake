class Admin::ItemsController < ApplicationController
  def index
    @items=Item.page(params[:page])#item.allのkaminariバージョン

  end

  def new
    @item=Item.new
  end

  def create
    item=Item.new(item_params)
    if item.save
      redirect_to admin_item_path(item.id)
    end
  end

  def show
    @item=Item.find(params[:id])

  end

  def edit
    @item=Item.find(params[:id])
  end

  def update
    item=Item.find(params[:id])
    if item.update(item_params)
      redirect_to admin_item_path(item.id)
    end
  end


  private
  def item_params
    params.require(:item).permit(:id,:name,:introduction,:price,:is_active,:image)
  end

end
