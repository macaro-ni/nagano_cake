class Public::CartItemsController < ApplicationController


  def index
    @cart_items=CartItem.all
  end

  def update
  end

  def destroy
  end

  def destroy_all
    customer=current_customer
    customer.cart_item.destory_all
  end

  def create
    cart_item=CartItem.find_by(cart_item_params[:item_id])
    cart_item.customer_id=current_customer.id
    cart_item.save(cart_item_params)
    redirect_to cart_items_path
  end

  ## 小計を求めるメソッド
  def subtotal
      item.with_tax_price * amount
  end


  private
  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount)
  end

end
