class HomeController < ApplicationController
  def index
  end

  def contact_us
  end

  def menu	
  	@sections = Section.all

  	@food_items = FoodItem.get_menu_by_params(params[:section], params[:orderby])
  	# if params[:section]
  	# 	@food_items = Section.where(section_name: params[:section]).take.food_items
  	# else
  	# 	@food_items = FoodItem.all
  	#end

  end
end
