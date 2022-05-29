class Public::OrdersController < ApplicationController

  before_action :authenticate_customer!, except: [:top, :about]

  def new
    @order = Order.new
    if CartItem.where(customer_id:current_customer.id).exists? == false
    redirect_to cart_items_path
    end
    @addresses = current_customer.addresses
  end

  def confirm
    @order = Order.new(order_params)
    @order.shipping_cost = 800
    @subtotal = 0

    if params[:order][:address_method] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name

    elsif params[:order][:address_method] == "1"
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name

    elsif params[:order][:address_method] == "2"
      @order.postal_code = params[:order][:post_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
    else
      render "new"
    end

    @cart_items = current_customer.cart_items
     #binding.pry
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.status = 0
    @order.save

    current_customer.cart_items.each do |cart_item|
    @order_detail = OrderDetail.new
    @order_detail.order_id = @order.id
    @order_detail.item_id = cart_item.item.id
    @order_detail.price = cart_item.item.price
    @order_detail.amount = cart_item.amount
    @order_detail.making_status = 0
    @order_detail.save
    end
    current_customer.cart_items.destroy_all
    redirect_to complete_path
  end

  def index
    @orders = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])
    @orders = Order.all
  end

  private

  def order_params
   params.require(:order).permit(:customer_id, :postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method, :status)
  end

end
