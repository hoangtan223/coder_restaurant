class Order < ApplicationRecord
	has_many :order_details

	def calculate_total_price

		self.total_price = 0
		self.order_details.each do |detail|
			self.total_price += detail.price
		end

		self.total_price += 20000 #shipping fee
		p total_price
	end
end
