# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

100.times do 
  Car.create(model: Faker::Company.name, make: Faker::Company.suffix, fuel_type: Faker::Company.industry, location: Faker::Address.city, reg_number: Faker::Number.number(digits: 10), price: Faker::Number.decimal(l_digits: 2), user_id: Faker::Number.decimal_part(digits: 2), seats: Faker::Number.between(from: 1, to: 10))
  puts "making car user"
end
