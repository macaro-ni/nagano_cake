class Public::OrdersController < ApplicationController


  def new
    @order=Order.new
  end

  def create
    @cart_items=CartItem.all
    @order=Order.new(order_params)

    if @order.save
      @cart_items.each do |cart_item|
        order_detail=OrderDetail.new
        order_detail.order_id=current_customer.order.id
        order_detail.item_id= cart.item.item.id
        order_detail.price=cart_item.item.with_tax_price
        order_detail.amount=cart_item.amount
        order_detail.save
      end
    end
    redirect_to complete_orders_path
  end

  def confirm
    @order=Order.new(order_params)
    if params[:order][:address] == "0"
      @order.postal_code= current_customer.postal_code
      @order.address=current_customer.address
      @order.name=current_customer.last_name + current_customer.first_name
    elsif params[:order][:address]=="1"
      @address_new=current_customer.addresses.new(address_params)
    end


    @cart_items=CartItem.all
    @order.customer_id=current_customer.id
    @order.shipping_cost=800
    @total=0

  end

  def complete
  end

  def index
  end

  def show
  end


private

  def address_params
    params.require(:order).permit(:postal_code, :address, :name)
  end

  def order_params
      params.require(:order).permit(:postal_code, :address, :name, :payment_method)
  end

  def order_detail_params
     params.require(:order_detail).permit(:order_id,:item_id,:price,:amount)
  end

end
