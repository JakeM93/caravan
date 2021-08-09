class CarsController < ApplicationController
  skip_before_action :authenticate_user!, only: %I[index show]
  before_action :find_car, only: [:edit, :update]

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
    @car = Car.find(params[:id])
    @markers = {
      lat: @car.latitude,
      lng: @car.longitude
    }
  end

  def new
    # New instance of a car
    @car = Car.new
  end

  def create
    # Creates new instance of a Car with strong params!
    @car = Car.new(car_strong_params)
    @car.user_id = current_user.id
    @car.location = @car.address # Formatted address for geocoder, House Num, Street, Postal Code
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
      :model, :make, :reg_number, :price, :user_id, :description,
      :transmission, :fuel_type, :seats, :longitude, :latitude, :house_num,
      :street, :city, :town, :postal_code, :country, car_url: []
    )
  end
end
