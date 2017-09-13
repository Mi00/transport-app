# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
PlnInvoice.create(number: "456/2016",
 					city: "szczecin", 
 					inv_date: "12-05-16", 
 					sell_date: "13-05-2016", 
 					payment_form: "przelew", 
 					payment_term: 25, 
 					payment_day: "25-05-2016", 
 					route: "polska - niemcy", 
 					load_date: "25-05-2016", 
 					price_netto: 2333, 
 					price_brutto: 2666, 
 					total_netto: 2333, 
 					total_brutto: 2666, 
 					original: true, 
 					buyer_id: 1, 
 					seller_id: 1, 
 					car_numbers: "ZS 43543")
