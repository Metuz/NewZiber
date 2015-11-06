# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#Brands
Brand.create(name: "Cooler Master", pin: "CM")
Brand.create(name: "Thermal Master", pin: "TM")
Brand.create(name: "Evercool", pin: "EC")
#categories
Category.create(name: "Accesorios")
Category.create(name: "Bases Enfriadoras Lap-Top")
Category.create(name: "Disipadores para Chipset")
#Locations
Location.create(name: "Plaza Computacion", phone: "55-55-55-55", address: "far far away", pin: "PC")
Location.create(name: "Naucalpan", phone: "55-55-55-55", address: "far far away", pin: "NP")
#Products
Product.create(name: "Mouse Mizard", category_id: 1, brand_id: 1, quantity: 29, location_id: 1)
Product.create(name: "Case Sata 5.25 Max 5G USB 3.0", category_id: 1, brand_id: 2, quantity: 30, location_id: 1)
Product.create(name: "Notepal i100 negra", category_id: 2, brand_id: 1, quantity: 15, location_id: 2)
Product.create(name: "C1", category_id: 2, brand_id: 1, quantity: 35, location_id: 2)
Product.create(name: "Armada activo", category_id: 3, brand_id: 3, quantity: 10, location_id: 2)
#User
User.create(username: "Juan Perez", email: "admin@admin.com", password: "admin666", password_confirmation: "admin666", admin: true)
User.create(username: "Pedro Perez", email: "manager1@admin.com", password: "manager111", password_confirmation: "manager111", manager: true, location_id: 1)
User.create(username: "Pedro Lopez", email: "manager2@admin.com", password: "manager222", password_confirmation: "manager222", manager: true, location_id: 2)
User.create(username: "Pablo Perez", email: "tecnico1@admin.com", password: "tecnico111", password_confirmation: "tecnico111", technician: true, location_id: 2)
User.create(username: "Pablo Lopez", email: "tecnico2@admin.com", password: "tecnico222", password_confirmation: "tecnico222", technician: true, location_id: 1)
User.create(username: "Fabi Perez", email: "recepcionista1@admin.com", password: "recepcionista111", password_confirmation: "recepcionista111", receptionist: true, location_id: 1)
User.create(username: "Fabi Lopez", email: "recepcionista2@admin.com", password: "recepcionista222", password_confirmation: "recepcionista222", receptionist: true, location_id: 2)
#Client
Client.create(clientname: "Rod", email: "rod@rod.com", phone: "666-666", address: "No se donde vive", password: "chicharito", password_confirmation: "chicharito")
Client.create(clientname: "Metuz", email: "metuz@metuz.com", phone: "666-666", address: "No se donde vive", password: "eluveitie", password_confirmation: "eluveitie")
#Puts
p "Brands created #{Brand.count}"
p "Categories created #{Category.count}"
p "Locations created #{Location.count}"
p "Products created #{Product.count}"
p "Users created #{User.count}"
p "Clients create #{Client.count}"
