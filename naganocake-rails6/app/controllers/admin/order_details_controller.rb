class Admin::OrderDetailsController < ApplicationController
  def update
    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order
    @order_details = @order.order_details

    #is_updated = true
    recive_making_status = params[:order_detail][:making_status]
    @order_detail.update(making_status: recive_making_status)
    if @order_detail.making_status == "製作中"
      @order.update(status: "製作中")
    end
    #@order_details.each do |order_detail|
    #  if order_detail.making_status != "製作完了"
    #    is_updated = false
    #  end
    #end
    #if is_updated == true
    #  @order.update(status: "発送準備中")
    #end
    if @order_details.all?{|making_status| making_status == "製作完了"}
      @order.update(status: "発送準備中")
    end
    redirect_to admin_order_path(@order)
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end
end