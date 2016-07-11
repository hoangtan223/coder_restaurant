class OrderDetail < ApplicationRecord
	belongs_to :order
	belongs_to :food_item, foreign_key: "item_id"

	def self.GenerateOrderDetails(hash_items)
		result = []
		hash_items.each do |key, value|
			item = FoodItem.find(key)
			result << self.new(quantity: value, price: item.price * value, food_item: item)
		end
		return result
	end
end
