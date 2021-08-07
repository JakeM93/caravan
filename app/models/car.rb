class Car < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many_attached :car_url

  geocoded_by :location
  after_validation :geocode

  validates :model, :make, :fuel_type, presence: true, length: { maximum: 50 }
  validates :location, presence: true, length: { maximum: 100 } # full address?
  validates :reg_number, :transmission, presence: true, length: { maximum: 10 }
  validates :price, presence: true
  validates :user_id, presence: true
  validates :seats, presence: true, inclusion: { in: 1..8, message: 'Invalid Option please choose between 1 to 8' }

  def address
    house_num_street = "#{house_num} #{street}"
    [house_num_street, city, town, postal_code, country].join(', ')
  end

  def car_name
    "#{make.capitalize} - #{model.capitalize}"
  end
end
