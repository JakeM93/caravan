class CarsController < ApplicationController
  def index
    # Return all cars from DB
    @cars = Car.all
  end

  def show
    @car = Car.find(params[:id])
  end
end
