class ToursController < ApplicationController
  before_action :set_tour, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!, only: %i[home index show]

  def home
  end

  def index
    @search = params[:query]
    if @search.present?
       @tours = Tour.search_by_description(@search)
    else
      @tours = Tour.all
    end
  end

  def show
    # @booking = params[:booking_id].present? ? Booking.where(id: params[:booking_id]).take : nil
  end

  def new
    @tour = Tour.new
  end

  def create
    @tour = Tour.new(tour_params)
    @tour.user = current_user
    if @tour.save
      redirect_to tour_path(@tour)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @tour.update(tour_params)
      redirect_to tour_path(@tour)
    else
      render :edit
    end
  end

  def destroy
    @tour.destroy
    redirect_to tours_path
  end

  def rockefeller
  end

  private

  def tour_params
    params.require(:tour).permit(:name, :description, :rating, :long, :lat, photos: [])
  end

  def set_tour
    @tour = Tour.find(params[:id])
  end
end
