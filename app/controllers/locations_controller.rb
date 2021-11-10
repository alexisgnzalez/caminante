class LocationsController < ApplicationController
  skip_before_action :authenticate_user!
  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)
    if @location.save
      redirect_to new_location_path
    else
      render :new
    end
  end

  private

  def location_params
    params.require(:location).permit(:name, :description, :long, :lat, :tour_id, :model, :view, photos: [])
  end
end
