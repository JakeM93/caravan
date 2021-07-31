class Booking < ApplicationRecord
  belongs_to :car
  belongs_to :user

  validates_presence_of :start_date, :end_date, :location
end
