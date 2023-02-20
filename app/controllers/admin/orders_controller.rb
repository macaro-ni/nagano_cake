class Admin::OrdersController < ApplicationController
  def show
    @order=Order.find(params[:id])
    @order_details=@order.order_details.all
  end

  # private
  # def order_detail_params
  #   params.require(:order_detail).permit(:order_id,:item_id,:price,:amount)
  # end
end
