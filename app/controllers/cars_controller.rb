class CarsController < ApplicationController
  def index
    # Return all cars from DB
    @cars = Car.all
  end

  def my_cars
    @cars = Car.where(user_id: current_user.id)
  end

  def show
    @car = Car.find(params[:id])
  end

  def new
    # New instance of a car
    @car = Car.new
  end

  def create
    # Creates new instance of a Car with strong params!
    @car = Car.new(car_strong_params)
    @car.save ? (redirect_to car_path(@car)) : (render :new)
  end

  def destroy
    @list.destroy
    redirect_to cars_path
  end

  private

  def car_strong_params
    # Permitted fields, update if adding any new car columns
    params.require(:car).permit(
      :make, :model, :location, :reg_number, :car_url,
      :price, :description, :transmission, :fuel_type, :seats
    )
  end
end
