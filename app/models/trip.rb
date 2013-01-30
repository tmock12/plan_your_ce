class Trip
  attr_accessor :options

  def initialize(options={})
    @options = options
  end

  def total_price
    CurrencyConverter.new("INR", options["pricing_summary"]["total_fare"], "USD").convert
  end

  def departure_flights
    build_flights(options["flights"]["flight"].first["segments"]["segment"])
  end

  def return_flights
    build_flights(options["flights"]["flight"].last["segments"]["segment"])
  end

  def build_flights(segment)
    if segment.kind_of?(Array)
      segment.map { |flight| Flight.new(flight) }
    else
      [] << Flight.new(segment)
    end
  end

end
