class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    # @order_detail = current_customer.order_detail
    @order_details = @order.order_details
  end

  def update
    @order = Order.find(params[:id])
    #@order_details = OrderDetail.where(order_id: params[:id])
    @order_details = @order.order_details
    recive_status = params[:order][:status]
    @order.update!(status: recive_status)
    if @order.status == "入金確認"
      @order_details.update_all(making_status: "製作待ち")
    end
    # order.update(order_params)
    # order_detail.update(order_detail_params)
    redirect_to admin_order_path(@order)

    #@items = Item.all
    #@order_detail = OrderDetail.find(params[:id])
    #render :show
  end

  private
  def order_params
    params.require(:order).permit(:status)
  end
end
