class AirportsController < ApplicationController

  def index
    @airports = Airport.order(:title).where("title ilike ?", "%#{params[:term]}%")
    render json: @airports.map(&:title)
  end
end
