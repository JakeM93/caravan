class Car < ApplicationRecord
  belongs_to :user

  validates :model, :make, :fuel_type, presence: true, length: { maximum: 50 }
  validates :location, presence: true, length: { maximum: 100 } # full address?
  validates :reg_number, :transmission, presence: true, length: { maximum: 10 }
  validates :price, presence: true
  validates :user_id, presence: true
  validates :seats, presence: true, inclusion: { in: 1..8, message: 'Invalid Option please choose between 1 to 8' }

end
