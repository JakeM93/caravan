class Car < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many_attached :car_url

  geocoded_by :address
  after_validation :geocode

  validates :model, :make, :fuel_type, presence: true, length: { maximum: 50 }
  # validates :location, presence: true, length: { maximum: 100 } # full address?
  validates :reg_number, :transmission, presence: true, length: { maximum: 10 }
  validates :price, presence: true
  validates :user_id, presence: true
  validates :seats, presence: true, inclusion: { in: 1..8, message: 'Invalid Option please choose between 1 to 8' }

  def address
    ## address":{"house_number":"32","road":"Burr Lane","town":"Ilkeston","city":"Erewash","county":"Derbyshire","state_district":"East Midlands","state":"England","postcode":"DE7 5JD","country":"United Kingdom","country_code":"gb"}
    house_num_street = "#{house_num} #{street}"
    [house_num_street, town, city, county, postal_code, country].join(', ') # UK Num Street, Post code
  end

  def car_name
    "#{make.capitalize} - #{model.capitalize}"
  end
end
