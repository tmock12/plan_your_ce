require 'spec_helper'

describe Flight do
  let(:flight) do
    Flight.new(
               {"index"=>"382",
                "departure_airport"=>"JAX",
                "arrival_airport"=>"MIA",
                "departure_date_time"=>"2013-05-15T11:20:00",
                "arrival_date_time"=>"2013-05-15T12:35:00",
                "flight_number"=>"3579",
                "airline"=>"AA",
                "operating_airline"=>"AA",
                "stops"=>"0",
                "equipment"=>"ER4",
                "duration"=>"4500"}
              )
  end

  describe "departure_airport" do
    it "should return the departure airports code" do
      flight.departure_airport.should eq("JAX")
    end
  end

  describe "arrival_airport" do
    it "should return the arrival airports code" do
      flight.arrival_airport.should eq("MIA")
    end
  end

  describe "departure_datetime" do
    it "returns the departure datetime" do
      flight.departure_datetime.should eq(Time.new(2013, 05, 15, 11, 20))
    end
  end

  describe "arrival_datetime" do
    it "returns the arrival datetime" do
      flight.arrival_datetime.should eq(Time.new(2013, 05, 15, 12, 35))
    end
  end

  describe "airline" do
    it "returns the airline IATA code" do
      flight.airline.should eq("AA")
    end
  end

end
