class Car < ApplicationRecord
  belongs_to :user

  validates :model, :make, presence: true, length: { maximum: 50 }
  validates :location, presence: true, length: { maximum: 100 } # full address?
  validates :reg_number, presence: true, length: { maximum: 10 }
  validates :price, presence: true
  validates :user_id, presence: true
end
