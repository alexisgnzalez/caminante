class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @booking.counter = -1
    @booking.user = current_user
    @booking.tour = Tour.find(params[:tour_id])
    @booking.save

    redirect_to map_tour_booking_path(params[:tour_id], @booking.id)
  end

  def map
    @tour = Tour.find(params[:tour_id])
    @booking = Booking.find(params[:id])
  end

  def ar_experience
    @tour = Tour.find(params[:tour_id])
    @booking = Booking.find(params[:id])
    @booking.counter += 1
    @booking.save
    if @booking.counter >= @tour.locations.size
      redirect_to tours_path
    end
  end
end
