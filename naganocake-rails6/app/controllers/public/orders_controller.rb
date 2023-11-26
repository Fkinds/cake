class Public::OrdersController < ApplicationController
  before_action :check_cart_items, only: [:new]

  def new

  end

  def confirm
    @postage = 800
    @sum = 0
    @total_payment = @postage.to_i + @sum.to_i
    @cart_items = current_customer.cart_items.all
    @order = Order.new(order_params)
    @order.customer = current_customer
    if params[:order][:address_select] == "0"
      @order.name = params[:order][:family_name] + params[:order][:given_name]
      @order.address = params[:order][:current_customer_address]
      @order.zip_code = params[:order][:current_customer_zip_code]
    elsif params[:order][:address_select] == "1"
      receive_address =  Address.find(params[:order][:address_id])
      @order.zip_code = receive_address.zip_code
      @order.name = receive_address.name
      @order.address = receive_address.address
    end
    #if from_new_to_confirm_strparams.invalid?
    if @order.invalid?
      redirect_to new_order_path
    end
  end

  def complete

  end

  def create
    @order = current_customer.orders.new(order_params)
    if @order.save!
      current_customer.cart_items.each do |cart_item|
        @order_detail = OrderDetail.new
        @order_detail.order_id = @order.id
        @order_detail.item_id = cart_item.item_id
        @order_detail.amount = cart_item.amount
        @order_detail.price = cart_item.item.tax_price
        @order_detail.save!
      end
    else
      render :new
    end
    cart_items = current_customer.cart_items
    cart_items.destroy_all
    redirect_to orders_complete_path
  end

  def index

  end

  def show

  end

  private

  def check_cart_items
    unless current_customer.cart_items.present?
      redirect_to cart_items_path
    end
  end

  def order_params
    params.require(:order).permit(:zip_code, :address, :name, :payment_method, :postage, :total_payment)
  end

  #def from_new_to_confirm_strparams
    #params.require(:order).permit(:address,:zip_code,:name)
  #end
end
