# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Booking.destroy_all
Car.destroy_all
User.destroy_all

Faker::Config.locale = 'en'

# Test Addresses for test accounts
addrs = [
  [11,"New Goulston Street","London","","E1 7EX","United Kingdom"],
  [12,"Cobb Street","London","","E1 7LB","United Kingdom"],
  [7,"Pomell Way","London","","E1 6NE","United Kingdom"],
  [6,"Rue Larribe","Paris","","75008","France"],
  [18,"Rue Loubouteux","Paris","","75017","France"],
  [12,"Rue Dulong","Paris","","75017","France"],
  [2,"New Goulston Street","London","","E1 7EX","United Kingdom"],
  [8,"Cobb Street","London","","E1 7LB","United Kingdom"],
  [3,"Pomell Way","London","","E1 6NE","United Kingdom"],
  [1,"Rue Larribe","Paris","","75008","France"],
  [10,"Rue Loubouteux","Paris","","75017","France"],
  [4,"Rue Dulong","Paris","","75017","France"],
  [5,"Rue Larribe","Paris","","75008","France"],
  [3,"Rue Loubouteux","Paris","","75017","France"],
  [6,"Rue Dulong","Paris","","75017","France"],
]

# Create 5 test users with 3 cars and 2 bookings
test_id = 0
addr_id = 0

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
      make: Faker::Vehicle.make,
      reg_number: Faker::Vehicle.license_plate,
      price: Faker::Number.between(from: 10, to: 100),
      user_id: test_account.id,
      description: Faker::Lorem.sentences,
      transmission: Faker::Vehicle.transmission,
      fuel_type: Faker::Vehicle.fuel_type,
      seats: Faker::Number.between(from: 2, to: 8),
      house_num: Faker::Number.between(from: 2, to: 8),
      street: Faker::Address.street_name,
      city: Faker::Address.city,
      town: addrs[addr_id][3],
      postal_code: Faker::Address.postcode,
      country: addrs[addr_id][5],
      location: addrs[addr_id][4])
      addr_id += 1

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
    make: Faker::Vehicle.make,
    location: Faker::Address.postcode,
    reg_number: Faker::Vehicle.license_plate,
    price: Faker::Number.between(from: 10, to: 100),
    user_id: new_user.id,
    description: Faker::Lorem.sentences,
    transmission: Faker::Vehicle.transmission,
    fuel_type: Faker::Vehicle.fuel_type,
    postal_code: Faker::Address.postcode,
    house_num: Faker::Number.between(from: 2, to: 8),
    city: Faker::Address.city,
    street: Faker::Address.street_name,
    seats: Faker::Number.between(from: 2, to: 8))
  car.save!

  puts "Creating Booking: #{fake_data_id}"
  booking = Booking.new(start_date: DateTime.now,
  end_date: DateTime.now + rand(2..14).days,
  location: Faker::Address.postcode,
  total_cost: car.price += rand(1..4),
  active: true,
  car_id: car.id,
  user_id: new_user.id)
  booking.save!
end

hello_seeds = Car.all
hello_seeds.each do |seed|
  url = Faker::LoremFlickr.image(size: "400x300", search_terms: ['car'])
  file = URI.open(url)
  seed.photos.attach(io: file, filename: Faker::File.file_name, content_type: 'image/png')
  puts "attached photo to seed"
end
