class OrdersController < ApplicationController
	def new
		if session[:cart_items]
			item_hash = OrderDetailHelper::to_hash_cart(session[:cart_items])

			order_details = OrderDetail.GenerateOrderDetails(item_hash)
			@order = Order.new(order_details: order_details)
			@order.calculate_total_price
		else
			@order = Order.new
		end

		render 'shopping_cart'
	end

	def create
		@order = Order.new(order_params)
		item_hash = OrderDetailHelper::to_hash_cart(session[:cart_items])
		order_details = OrderDetail.GenerateOrderDetails(item_hash)
		@order.order_details = order_details
		@order.calculate_total_price

		if @order.save
			session[:cart_items] = ""
			render 'thank_you'			
		else

		end

	end

	private 
	def order_params
		params.require(:order).permit(:customer_name, :phone_number, :address)
	end
end
