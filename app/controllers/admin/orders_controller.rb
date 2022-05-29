class Admin::OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    @orders = Order.all
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    if @order.status = 1
    @order_details = @order.order_details
    @order_details.each do |order_detail|
    order_detail.update(making_status:1)
    end
    end
    redirect_to admin_order_path(@order.id)
  end

  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method, :status)
  end

end
