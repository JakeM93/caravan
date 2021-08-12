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
def timestamp
  Time.now.getutc
end

start = timestamp

# Test Addresses for test account
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

cars = [
  ["Q2","Audi","DE07 JWN","audi-q2.jpg",300.00,"Amazing city car, great on fuel and good for shorter trips","Manual","Diesel",5],
  ["M2","BMW","BM16 MW2","bmw-m2.jpg",600.00,"Amazing car for long buisness trips with a bit more power and luxury","Manual","Diesel",5],
  ["Mustang","Ford","FM64 MUS","ford-mustang.jpg",1200.00,"Performace car which turns heads!! Great for weddings and Proms, not too great on fuel","Manual","Petrol",5],
  ["F150 Raptor","Ford","FR07 RAP","ford-raptor.jpg",1000.00,"4X4 for those off roading event and ocassions. Offroad in style and power!!","Manual","Diesel",6],
  ["Civic","Honda","HC20 CIC","honda-civic.jpg",500.00,"Great all round car, well looked after and cleaned after each use","Automatic","Diesel",5],
  ["Aventador","Lamborghini","LA16 AVE","lamborghini-aventador.jpg",1600.00,"Not much to say really picture says it all! Great for events such as wedding and proms.","Manual","Petrol",5],
  ["Sport","Range Rover","RR07 RRS","rangerover-sport.jpg",900.00,"Great Medium Family car for all types of climates and surfaces, best all round car!","Manual","Diesel",5],
  ["ForFour","Smart","SF07 SFF","smart-forfour.jpg",300.00,"Great city car, great for parking in tight spots, good commuter","Manual","Petrol",4],
  ["Model S","Tesla","TM19 MOS","tesla-s.jpg",900.00,"Very economical car, great for speed and city driving, all type commuter and family car","Manual","Petrol",5],
  ["Aygo","Toyota","TA07 TAY","toyota-aygo.jpg",300.00,"Great city car, great for parking in tight spots, good commuter","Manual","Petrol",5],
  ["Corsa","Vauxhall","VX19 VCO","Vauxhall-Corsa.jpg",500.00,"Great city car, great for parking in tight spots, good commuter","Manual","Petrol",5],
  ["Insiginia","Vauxhall","VX19 VIN","vauxhall-insignia.jpg",600.00,"Great family car, great ammount of storage space!","Manual","Diesel",5],
  ["Moka","Vauxhall","VX17 VMO","vauxhall-moka.jpg",550.00,"Great city and family car, good commuter","Automatic","Diesel",7],
  ["Viva","Vauxhall","VX22 VVI","vauxhall-viva.jpg",400.00,"Great city car, great for parking in tight spots, good commuter","Manual","Petrol",5],
  ["Golf","Volkswagen","VO19 VOG","Vauxhall-Corsa.jpg",450.00,"Great sporty car, great for city and drives out, good commuter and fun","Manual","Petrol",5],
]

# Create 5 test users with 3 cars and 2 bookings
test_id = 0
addr_id = 0
test_car_id = 0

5.times do
  test_id += 1
  puts "#{timestamp} - Creating Test User: #{test_id}"
  test_account = User.new(email: "test#{test_id}@test.com",
    first_name: "test#{test_id}",
    last_name: 'test',
    password: 'tester')
  test_account.save!

  # Creating 3 Cars
  3.times do
    puts "Creating cars"
    test_car = Car.create(model: cars[test_car_id][0],
      make: cars[test_car_id][1],
      reg_number: cars[test_car_id][2],
      car_url: cars[test_car_id][3],
      price: cars[test_car_id][4],
      user_id: test_account.id,
      description: cars[test_car_id][5],
      transmission: cars[test_car_id][6],
      fuel_type: cars[test_car_id][7],
      seats: cars[test_car_id][8],
      house_num: addrs[addr_id][0],
      street: addrs[addr_id][1],
      town: addrs[addr_id][2],
      postal_code: addrs[addr_id][4],
      country: addrs[addr_id][5],
      location: addrs[addr_id][4])
      addr_id += 1
      test_car_id += 1
      test_car.save!

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
    
  end
  test_account.save!
end

## Random Generated Data 

fake_data_id = 0
25.times do
  fake_data_id += 1
  puts ""
  puts "#{timestamp} - Making Fake User: #{fake_data_id}"
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


# hello_seeds = Car.sample(35)
Car.all.each do |seed|
  if seed.id > 15
  url = Faker::LoremFlickr.image(size: "400x300", search_terms: ['car'])
  file = URI.open(url)
  seed.photos.attach(io: file, filename: Faker::File.file_name, content_type: 'image/png')
  puts "#{timestamp} - Attached photo to Car: #{seed.id}"
  end
end

finish = timestamp
puts ""
puts "Started: #{start}"
puts "Finished: #{finish}"
