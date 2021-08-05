# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Car.destroy_all
User.destroy_all

# Create 5 test users with 3 cars and 2 bookings
test_id = 0
5.times do
  test_id += 1
  puts "Creating Test User: #{test_id}"
  test_account = User.new(email: "test#{test_id}@test.com",
    first_name: "test#{test_id}",
    last_name: 'test',
    password: 'tester')
  test_account.save!

  # Creating 3 Cars
  3.times do
    puts "Creating cars"
    test_car = Car.create(model: Faker::Vehicle.model,
      make: Faker::Vehicle.manufacture,
      location: Faker::Address.city,
      reg_number: Faker::Vehicle.license_plate,
      price: 500.00,
      user_id: test_account.id,
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
      transmission: Faker::Vehicle.transmission,
      fuel_type: Faker::Vehicle.fuel_type,
      seats: Faker::Number.between(from: 2, to: 8))

    # Creating bookings
    1.times do
      puts "Creating Bookings"
      test_booking = Booking.new(start_date: DateTime.now,
      end_date: DateTime.now + rand(2..14).days,
      location: Faker::Address.city,
      total_cost: test_car.price + rand(1..4),
      active: true,
      car_id: test_car.id,
      user_id: test_account.id)
      test_booking.save!
    end
    test_car.save!
  end
  test_account.save!
end

## Random Generated Data 

fake_data_id = 0
25.times do
  fake_data_id += 1
  puts ""
  puts "Making Fake User: #{fake_data_id}"
  new_user = User.new(email: Faker::Internet.email, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, password: "123456")
  new_user.save!

  puts "Making Fake Car: #{fake_data_id}"
  car = Car.create(model: Faker::Vehicle.model,
    make: Faker::Vehicle.manufacture,
    location: Faker::Address.city,
    reg_number: Faker::Vehicle.license_plate,
    price: 500.00,
    user_id: new_user.id,
    description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
    transmission: Faker::Vehicle.transmission,
    fuel_type: Faker::Vehicle.fuel_type,
    seats: Faker::Number.between(from: 2, to: 8))
  car.save!

  puts "Creating Booking: #{fake_data_id}"
  booking = Booking.new(start_date: DateTime.now,
  end_date: DateTime.now + rand(2..14).days,
  location: Faker::Address.city,
  total_cost: car.price += rand(1..4),
  active: true,
  car_id: car.id,
  user_id: new_user.id)
  booking.save!
end
