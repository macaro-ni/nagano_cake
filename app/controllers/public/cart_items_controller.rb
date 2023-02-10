class Public::CartItemsController < ApplicationController


  def index
  end

  def update
  end

  def destroy
  end

  def destroy_all
  end

  def create
    cart_item=CartItem.find_by(cart_item_params[:item_id])
    cart_item.customer_id=current_customer.id
    cart_item.save(cart_item_params)
    redirect_to cart_items_path
  end


  private
  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount)
  end

end
