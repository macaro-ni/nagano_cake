class Public::CartItemsController < ApplicationController


  def index
    @cart_items=CartItem.all
    @total=0
  end

  def update
    cart_item=CartItem.find(params[:id])
    cart_item.customer_id=current_customer.id
    cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
    cart_item=CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    cart_items=CartItem.all
    cart_items.destroy_all
    redirect_to cart_items_path
  end

  def create
    
    ##追加した商品がカート内に存在するかの判別
     # if Item.find_by(item_id: params[:item_id])
      #存在した場合,
      ##カート内の個数をフォームから送られた個数分追加する
     # cart_item.amount=cart_item.amount.to_i+params[:amount].to_i
     # else
      cart_item=CartItem.new(cart_item_params)
      #end
    cart_item.customer_id=current_customer.id
    cart_item.save
    redirect_to cart_items_path
  end

  private
  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount)
  end

end
