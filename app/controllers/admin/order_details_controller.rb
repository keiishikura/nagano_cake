class Admin::OrderDetailsController < ApplicationController


  def update
    @order_detail = OrderDetail.find(params[:id])
    @order_detail.update(order_detail_params)
    @order = @order_detail.order
    @order_details = @order.order_details

    if @order_details.where(making_status:3).count == @order_details.count
    @order.update(status:3)
    elsif @order_details.where(making_status:2).exists? == true
    @order.update(status:2)
    end
    redirect_to admin_order_path(@order.id)
  end

  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end

end
