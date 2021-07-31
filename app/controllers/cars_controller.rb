class CarsController < ApplicationController
  def index
    # Return all cars from DB
    @cars = Car.all
  end
end
