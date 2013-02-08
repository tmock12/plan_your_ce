class AirportsController < ApplicationController

  def index
    @airports = Airport.order(:title).where("title ilike ?", "%#{params[:term]}%").pluck(:title)
    render json: @airports
  end
end
