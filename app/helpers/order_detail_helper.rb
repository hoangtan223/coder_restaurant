module OrderDetailHelper
	def self.get_update_cart_hash(order_detail, cart_items_string)
		if cart_items_string
			items_hash = to_hash_cart cart_items_string
			if (items_hash.key?(order_detail.item_id))
				items_hash[order_detail.item_id] += order_detail.quantity
			else
				items_hash[order_detail.item_id] = order_detail.quantity
			end
			return items_hash
		else
			items = Hash.new
			items[order_detail.item_id] = order_detail.quantity
			return items
		end
	end

	def self.to_hash_cart(arr_sep=',', key_sep='=>', cart_items_string)
		if cart_items_string.start_with?('{')
			cart_items_string.slice!(0)
			cart_items_string.slice!(cart_items_string.length-1)
		end
		p cart_items_string
		array = cart_items_string.split(arr_sep)
		hash = {}

		array.each do |e|
			key_value = e.split(key_sep)
			hash[key_value[0].to_i] = key_value[1].to_i
		end

		return hash
	end
end


