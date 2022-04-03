class Admin::OrdersController < ApplicationController
  
  def show
    @order = Order.find(params[:id])
  end
  
  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :payment_method, :status)
  end
  
end
