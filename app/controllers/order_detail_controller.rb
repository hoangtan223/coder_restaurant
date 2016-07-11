class OrderDetailController < ApplicationController
  def add_to_cart
   	order_detail = OrderDetail.new(order_detail_params)
   	item_hash = OrderDetailHelper::get_update_cart_hash(order_detail,session[:cart_items])
  	session[:cart_items] = item_hash.to_s
  	order_details = OrderDetail.GenerateOrderDetails(item_hash)
  	@order = Order.new(order_details: order_details)

  	render 'orders/shopping_cart'
  end

  private 

  def order_detail_params
  	params.require(:order_detail).permit(:item_id, :quantity)
  end
end