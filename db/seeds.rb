# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

section_list = [
	["Breakfast", "Breakfast dishes"],
	[ "Lunch", "Lunch dishes" ],
	[ "Dinner", "Dinner dishes" ],
	[ "Drink", "Drinks" ]
]

food_list = [
	[ "Pho Bo", "Vietnamese famous noodle", "Breakfast", 35000],
	[ "Bun Bo", "Vietnamese famous noodle", "Breakfast", 35000],
	[ "Hu Tieu", "Vietnamese famous noodle", "Breakfast", 30000],
	[ "Op la", "Made from eggs", "Breakfast", 15000],
	[ "Banh Canh", "Vietnamese famous noodle", "Breakfast", 25000],

	[ "Com Ga", "Lunch meal", "Lunch", 35000],
	[ "Com Suon", "Lunch meal", "Lunch", 15000],
	[ "Com Nieu", "Lunch meal", "Lunch", 25000],
	[ "My Quang", "Lunch meal", "Lunch", 65000],
	[ "Chao Long", "Lunch meal", "Lunch", 10000]
]


section_list.each do |name, desc| 
	unless Section.exists? :section_name => name
		Section.create(section_name: name, description: desc)
	end
end

food_list.each do |name,desc,section,price|
section1 = Section.where(section_name: section).take
FoodItem.create(name: name, description: desc, price: price, section: section1)
end
