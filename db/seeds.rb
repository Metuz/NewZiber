# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#Brands
#Brand.create(name: "Cooler Master")
#Brand.create(name: "Thermal Master")
#Brand.create(name: "Evercool")
#categories
#Category.create(name: "Accesorios")
#Category.create(name: "Bases Enfriadoras Lap-Top")
#Category.create(name: "Disipadores para Chipset")
#Locations
Location.create(name: "Plaza Computacion", phone: "55-55-55-55", address: "far far away")
Location.create(name: "Naucalpan", phone: "55-55-55-55", address: "far far away")
#Products
#Product.create(name: "Mouse Mizard", category_id: 1, brand_id: 1, quantity: 29, location_id: 1)
#Product.create(name: "Case Sata 5.25 Max 5G USB 3.0", category_id: 1, brand_id: 2, quantity: 30, location_id: 1)
#Product.create(name: "Notepal i100 negra", category_id: 2, brand_id: 1, quantity: 15, location_id: 2)
#Product.create(name: "C1", category_id: 2, brand_id: 1, quantity: 35, location_id: 2)
#Product.create(name: "Armada activo", category_id: 3, brand_id: 3, quantity: 10, location_id: 2)
#User
User.create(username: "Admin", email: "admin@admin.com", facebook: "Far Far Away", twitter: "Admin", password: "admin666", password_confirmation: "admin666", admin: true)
User.create(username: "Manager", email: "manager@admin.com", facebook: "Far Far Away", password: "manager666", password_confirmation: "manager666", manager: true, location_id: 1)
User.create(username: "Technician", email: "technician@admin.com", facebook: "Far Far Away", twitter: "LOL", password: "technician666", password_confirmation: "technician666", technician: true, location_id: 2)
User.create(username: "Receptionist", email: "receptionist@admin.com", facebook: "Far Far Away", password: "receptionist666", password_confirmation: "receptionist666", receptionist: true, location_id: 1)
#Puts
#p "Brands created #{Brand.count}"
#p "Categories created #{Category.count}"
p "Locations created #{Location.count}"
#p "Products created #{Product.count}"
p "Users created #{User.count}"
