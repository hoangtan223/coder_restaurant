# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

section_list = [
	[ "Lunch", "Lunch dishes" ],
  [ "Dinner", "Dinner dishes" ],
  [ "Snack", "Snack dishes" ]
]

section_list.each do |name, desc| 
	unless Section.exists? :section_name => name
		Section.create(section_name: name, description: desc)
	end
end