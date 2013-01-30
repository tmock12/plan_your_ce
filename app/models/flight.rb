class Flight
  attr_accessor :options

  def initialize(options={})
    @options = options
  end

  def departure_airport
    options["departure_airport"]
  end

  def arrival_airport
    options["arrival_airport"]
  end

  def departure_datetime
    Time.parse(options["departure_date_time"])
  end

  def arrival_datetime
    Time.parse(options["arrival_date_time"])
  end

  def airline
    options["airline"]
  end

end
