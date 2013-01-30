require 'spec_helper'

describe Trip do

  let(:trip) do
    Trip.new({
      "pricing_summary" => {"total_fare"=>"7550.37"},
      "flights"=> {
        "flight" => [{
          "segments"=> {
            "segment"=> [
              {"index"=>"380"}, {"index"=>"1"}
            ]
          }
        }, {
          "segments"=> {
            "segment"=> [
              {"index"=>"5"}]}}]}})
  end

  describe "total_price" do
    it "should equal the price of the ticket converted to US dollars" do
      VCR.use_cassette "currency_converter" do
        trip.total_price.should eq(141.1919)
      end
    end
  end

  describe "departure_flights" do
    it "returns an array of flights" do
      trip.departure_flights.first.class.should eq(Flight)
    end
  end

  describe "return_flights" do
    it "returns an array of flights" do
      trip.return_flights.first.class.should eq(Flight)
    end
  end

end
