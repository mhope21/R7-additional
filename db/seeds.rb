# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
require 'faker'

20.times do
  Customer.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    phone: Faker::Number.number(digits: 10)
  )
end

puts "Created 20 fake customers"

customers = Customer.all

if customers.any?
  20.times do
    Order.create!(
      product_name: Faker::Commerce.product_name,    # Generates a random product name
      product_count: Faker::Number.between(from: 1, to: 100), # Generates a random product count between 1 and 100
      customer_id: customers.sample.id               # Randomly selects a customer ID from existing customers
    )
  end

  puts "Created 20 fake orders"
else
  puts "No customers found. Please seed customers first."
end
