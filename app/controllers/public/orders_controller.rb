class Public::OrdersController < ApplicationController


  def new
    @order=Order.new
  end

  def create
    @cart_items=current_customer.cart_items.all
    @order=current_customer.orders.new(order_params)

    @order.save
    if @order.save
      @cart_items.each do |cart_item|
        order_detail=OrderDetail.new
        order_detail.order_id=@order.id
        order_detail.item_id= cart_item.item_id
        order_detail.price=cart_item.item.with_tax_price
        order_detail.amount=cart_item.amount
        order_detail.save!
      end
    redirect_to complete_orders_path
    @cart_items.destroy_all
    end
  end

  def confirm
    @order=Order.new(order_params)
    if params[:address_radio] == "0"
      @order.postal_code= current_customer.postal_code
      @order.address=current_customer.address
      @order.name=current_customer.last_name + current_customer.first_name
    elsif params[:address_radio]=="1"
      @order.postal_code=params[:order][:postal_code]
      @order.address=params[:order][:address]
      @order.name=params[:order][:name]
    end


    @cart_items=CartItem.all
    @order.customer_id=current_customer.id
    @order.shipping_cost=800
    @total=0

  end

  def complete
  end

  def index
    @orders=current_customer.orders.page(params[:page])#.allのkaminariバージョン
  end

  def show
    @order=Order.find(params[:id])
    @order_details=@order.order_details.all
  end


private


  def order_params
      params.require(:order).permit(:postal_code, :address, :name, :payment_method,:shipping_cost,:total_payment)
  end

  def order_detail_params
     params.require(:order_detail).permit(:order_id,:item_id,:price,:amount)
  end

end
