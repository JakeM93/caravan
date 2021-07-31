class BookingsController < ApplicationController
  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.car = @car
    @booking.user = @user
    if @booking.after_save 
      redirect to booking_path
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
end
