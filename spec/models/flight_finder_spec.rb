require 'spec_helper'

vcr_options = { :cassette_name => "atl_jax"}
describe FlightFinder, vcr: vcr_options do

  let (:data) do
    {
      origin_airport: "Atlanta, GA-ATL",
      destination_airport: "Jacksonville, FL-JAX",
      passengers: "1",
      departure: {"date(1i)"=>"2013", "date(2i)"=>"5", "date(3i)"=>"12"},
      return: {"date(1i)"=>"2013", "date(2i)"=>"5", "date(3i)"=>"15"}
    }
  end
  let (:flight_finder) { FlightFinder.new(data) }

  describe ".origin_airport" do
    it "returns the originating airport code" do
      flight_finder.origin_airport.should eq("ATL")
    end
  end

  describe ".destination_airport" do
    it "returns the destination airport code" do
      flight_finder.destination_airport.should eq("JAX")
    end
  end

  describe ".departure_date" do
    it "is in 'YYYY-MM-DD' format" do
      flight_finder.departure_date.should eq("2013-05-12")
    end
  end

  describe ".return_date" do
    it "is in 'YYYY-MM-DD' format" do
      flight_finder.return_date.should eq("2013-05-15")
    end
  end

  describe ".passengers" do
    it "returns the number of passengers" do
      flight_finder.passengers.should eq("1")
    end
  end

  describe ".params" do
    it "returns a hash of params" do
      flight_finder.params.should eq(
        {"from"=>"ATL",
         "to"=>"JAX",
         "depart-date"=>"2013-05-12",
         "return-date"=>"2013-05-15",
         "adults"=>"1",
         "permitted-carriers"=>"AA-DL",
         "sort"=>"asc"}
      )
    end
  end

  describe ".trips" do
    it "returns an array of trips" do
      flight_finder.trips.first.class.should eq(Trip)
    end
  end

end
