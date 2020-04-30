# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

 status = ["Sold", "New Listing", "Pending"]
#  5.times do
#   Company.create(name: Faker::Company.name)
#  end

# 5.times do
#   User.create(username: Faker::Name.first_name,
#                   email: Faker::Internet.email,
#                   password: SecureRandom.hex,
#                   company_id: rand(1..5))
# end

15.times do
  Client.create(name: Faker::Name.name,
                email: Faker::Internet.email)
end

30.times do
  Property.create(address: Faker::Address.street_address,
                  price: Faker::Number.number(digits: 6),
                  company_id: rand(1..5),
                  status: status.sample
                )

  end

  20.times do
    UserClient.create(
      user_id: rand(10..15),
      client_id: rand(1..15)
  )
end

Property.all.each do |p|
  5.times do 
    p.clients << Client.find(rand(1..15))
  end
end

  
