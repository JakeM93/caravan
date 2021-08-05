class CarsController < ApplicationController
  skip_before_action :authenticate_user!, only: %I[index show]
  before_action :find_car, only: [:show, :edit, :update]

  def index
    # Return all cars from DB
    @cars = Car.all
  end

  def my_cars
    @cars = Car.where(user_id: current_user.id)
  end

  def show
  end

  def new
    # New instance of a car
    @car = Car.new
  end

  def create
    # Creates new instance of a Car with strong params!
    @car = Car.new(car_strong_params)
    @car.user_id = current_user.id
    @car.save ? (redirect_to car_path(@car)) : (render :new)
  end

  def edit
  end

  def update
    @car.update(car_strong_params)
    redirect_to car_path(@car)
  end

  def destroy
    @car.destroy
    redirect_to cars_path
  end

  private

  def find_car
    @car = Car.find(params[:id])
  end

  def car_strong_params
    # Permitted fields, update if adding any new car columns
    params.require(:car).permit(
      :model, :make, :location, :reg_number, :price, :description,
      :transmission, :fuel_type, :seats, :user_id, car_url: []
    )
  end
end
