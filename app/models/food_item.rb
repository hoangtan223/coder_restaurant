class FoodItem < ApplicationRecord
	validates :name, :section, :price, presence: true
	validates :price, numericality: {greater_than_or_equal_to: 0 }

	def image_url
		if remote_image_url.present?
			remote_image_url
		else
			"http://loremflickr.com/320/240/#{CGI.escape name}"
		end
	end
end
