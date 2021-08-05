class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @car = Car.find(params[:car_id])
  end

  def my_bookings
    @bookings = Booking.where(user_id: current_user.id)
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.car_id = params[:car_id]
    if @booking.save 
      redirect_to car_bookings_path(@booking.car_id)
    else
      render :new
    end
  end

  def show
  end

  def index
    redirect_to my_bookings_car_bookings_path
  end

  def destroy
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :location, :car_id)
  end
end
