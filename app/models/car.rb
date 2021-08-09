class Car < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many_attached :car_url

  geocoded_by :address
  after_validation :geocode

  validates :model, :make, :fuel_type, presence: true, length: { maximum: 50 }
  validates :reg_number, :transmission, presence: true, length: { maximum: 10 }
  validates :price, presence: true
  validates :user_id, presence: true
  validates :seats, presence: true, inclusion: { in: 1..8, message: 'Invalid Option please choose between 1 to 8' }
  validates :description, presence: true
  validates :house_num, :street, :postal_code, presence: true

  # Combine the house_num, street and postcode into a string to pass to api
  # This will set the location field with this string.
  def address
    house_num_street = "#{house_num} #{street}"
    [house_num_street, postal_code].join(', ')
  end

  # Combine the car Manufacture with model as the name
  def car_name
    "#{make.capitalize} - #{model.capitalize}"
  end
end
