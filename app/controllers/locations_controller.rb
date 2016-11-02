class LocationsController < ApplicationController

  # POST /locations
  def create
    @location = Location.new(location_params)

    if @location.save
      render json: @location, status: :created, location: @location
    else
      render json: @location.errors, status: :unprocessable_entity
    end
  end

  private

    # Only allow a trusted parameter "white list" through.
    def location_params
      params.require(:location).permit(:name, :latitude, :longitude, :time_zone)
    end
end
