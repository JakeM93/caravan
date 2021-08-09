class CarsController < ApplicationController
  skip_before_action :authenticate_user!, only: %I[index show]
  before_action :find_car, only: [:show, :edit, :update]

  def index
    if params[:query].present?
      sql_query = "model ILIKE :query OR make ILIKE :query OR location ILIKE :query OR town ILIKE :query OR city ILIKE :query OR description ILIKE :query OR country ILIKE :query OR postal_code ILIKE :query"
      @cars = Car.where(sql_query, query: "%#{params[:query]}%")
    else
      @cars = Car.all
    end
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
    @car = Car.find(params[:id])
    @car.destroy
    redirect_to my_cars_cars_path
  end

  # Generate Address where car is located, give option for Owners Address?
  def address
    [street, city, state_town, country].compact.join(', ')
  end

  private

  def find_car
    @car = Car.find(params[:id])
  end

  def car_strong_params
    # Permitted fields, update if adding any new car columns
    params.require(:car).permit(
      :model, :make, :location, :reg_number, :price, :description,
      :transmission, :fuel_type, :seats, :user_id, photos: [])
  end
end
