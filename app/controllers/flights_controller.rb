class FlightsController < ApplicationController
  expose(:course)
  expose(:flight_finder) { FlightFinder.new(params) }
  expose(:trips) { flight_finder.trips }

  def create
    if flight_finder.valid?
      render :index
    else
      flash.now[:error] = "Please enter valid departure and destination airports"
      render :new
    end
  end
end
