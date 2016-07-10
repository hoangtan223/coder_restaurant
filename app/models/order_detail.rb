class OrderDetail < ApplicationRecord
	belongs_to :order
	belongs_to :food_item, foreign_key: "item_id"
end
