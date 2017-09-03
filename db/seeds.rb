# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   Character.create(name: 'Luke', movie: movies.first)
shipping_options = ShippingOption.create([
  { name: 'Durban Self-Collection', estimated_delivery: '', additional_info: 'We will be in contact with you to arrange a pick up time.' },
  { name: 'SA Postal Service', price: 15, estimated_delivery: '1-2 weeks', country_limitations: 1 },
  { name: 'SA Courier', price: 54, estimated_delivery: '2 days', country_limitations: 1 },
  { name: 'International', price: 250, estimated_delivery: '1-2 Months', country_limitations: 2, additional_info: "Using SA Postal Service" }
  ])
