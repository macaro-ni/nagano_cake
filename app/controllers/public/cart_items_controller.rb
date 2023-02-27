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
    current_item=CartItem.new(cart_item_params)
    ##追加した商品がカート内に存在するかの判別
    same_cart_item=CartItem.find_by(item_id: current_item.item_id)
    if same_cart_item.present?
      #存在した場合,
      ##カート内の個数をフォームから送られた個数分追加する
      #same_cart_item.amount=same_cart_item.amount.to_i+current_item.amount.to_i
        if same_cart_item.update(amount: same_cart_item.amount.to_i+current_item.amount.to_i)
          flash[:notice]="カート内商品の個数が変更されました"
        end
    else
      current_item.customer_id=current_customer.id
        if current_item.save
          flash[:notice]="カートに商品が追加されました"
        end
    end
    redirect_to cart_items_path
  end

  private
  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount)
  end

end
