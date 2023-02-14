class Public::OrdersController < ApplicationController


  def new
    @order=Order.new
  end

  def create
    order=Order.new(order_params)
    order.customer_id=current_customer.id
    order.shipping_cost=800
    #合計を、とりあえず０で入れてる
    order.total_payment=0+order.shipping_cost
    order.save
    redirect_to confirm_orders_path
  end

  def confirm
    @cart_items=CartItem.all
    @total=0
    @shipping_cost=800
    @order_detail=OrderDetail.new
    @order_detail.save(order_detail_params)

  end

  def complete
  end

  def index
  end

  def show
  end


    private
  def order_params
      params.require(:order).permit(:postal_code, :address, :name, :payment_method)
  end

  def order_detail_params
    params.require(:order_detail).permit(:order_id,:item_id,:price,:amount)
  end

end
