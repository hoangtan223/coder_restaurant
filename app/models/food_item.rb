class FoodItem < ApplicationRecord
	belongs_to :section

	validates :name, :price, presence: true
	validates :price, numericality: {greater_than_or_equal_to: 0 }

	def image_url
		if remote_image_url.present?
			remote_image_url
		else
			"http://loremflickr.com/320/240/#{name}"
		end
	end

	def self.search_by_name(name)
		if name
			where("lower(name) LIKE ?", "%#{name.downcase}%")
					.order(created_at: :desc)
		else
			all
					.order(created_at: :desc)
		end
	end
end
