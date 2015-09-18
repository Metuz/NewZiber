# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#Brands
Brand.create(name: "Cooler Master")
Brand.create(name: "Thermal Master")
Brand.create(name: "Evercool")
#categories
Category.create(name: "Accesorios")
Category.create(name: "Bases Enfriadoras Lap-Top")
Category.create(name: "Disipadores para Chipset")
#Locations
Location.create(name: "Plaza Computacion")
Location.create(name: "Naucalpan")
#Products
Product.create(name: "Mouse Mizard", category_id: 1, brand_id: 1, quantity: 29, location_id: 1)
Product.create(name: "Case Sata 5.25 Max 5G USB 3.0", category_id: 1, brand_id: 2, quantity: 30, location_id: 1)
Product.create(name: "Notepal i100 negra", category_id: 2, brand_id: 1, quantity: 15, location_id: 2)
Product.create(name: "C1", category_id: 2, brand_id: 1, quantity: 35, location_id: 2)
Product.create(name: "Armada activo", category_id: 3, brand_id: 3, quantity: 10, location_id: 2)
#User
User.create(username: "Admin", email: "admin@admin.com", phone: "666", address: "Far Far Away", password: "administrator", password_confirmation: "administrator")
#Puts
p "Brands created #{Brand.count}"
p "Categories created #{Category.count}"
p "Locations created #{Location.count}"
p "Products created #{Product.count}"
p "Users created #{User.count}"
