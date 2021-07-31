# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Car.destroy_all
User.destroy_all
new_user = User.new(email: Faker::Internet.email, first_name: "123456", last_name: "123456", password: "123456")
new_user.save!

100.times do 
  car = Car.create(model: Faker::Company.name, user_id: new_user.id, transmission: Faker::Number.number(digits: 10), make: Faker::Company.suffix, fuel_type: Faker::Company.industry, location: Faker::Address.city, reg_number: Faker::Number.number(digits: 10), price: Faker::Number.decimal(l_digits: 2), seats: Faker::Number.between(from: 1, to: 8))
  car.save!
  puts "making car user"
end
