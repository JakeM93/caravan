class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @car = Car.find(params[:car_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.car = @car(params: car_id)
    @booking.user = current_user
    if @booking.after_save 
      redirect to car_booking_path
    else
      render :new
    end
  end

  def show
  end

  def index
  end

  def destroy
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :location, :car_id)
  end
end
