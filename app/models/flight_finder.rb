class FlightFinder

  attr_accessor :options

  def initialize(options={})
    @options = options
  end

  def trips
    response[0..5].map do |trip|
      Trip.new(trip)
    end
  end

  def response
    Hash.from_xml(request.body)["air_search_result"]["solutions"]["solution"]
  end

  def request
    conn = Faraday.new(ENV['CLEARTRIP_URL'])
    conn.headers['X-CT-API-KEY'] = ENV['CLEARTRIP_API_KEY']
    conn.params = params
    conn.get
  end

  def params
    {}.tap do |h|
      h['from'] = origin_airport
      h['to'] = destination_airport
      h['depart-date'] = departure_date
      h['return-date'] = return_date
      h['adults'] = passengers
      h['permitted-carriers'] = "AA-DL"
      h['sort'] = "asc"
    end
  end

  def origin_airport
    airport_code_for(options[:origin_airport])
  end

  def destination_airport
    airport_code_for(options[:destination_airport])
  end

  def airport_code_for(airport)
    Airport.find_by_title(airport).iata_code
  end

  def departure_date
    format_date(options[:departure])
  end

  def return_date
    format_date(options[:return])
  end

  def format_date(date)
    Date.strptime(date.values.join('-')).to_s(:api)
  end

  def passengers
    options[:passengers]
  end

  def valid?
    [:origin_airport, :destination_airport].each do |f|
      return options[f].present? && Airport.valid_title?(options[f])
    end
  end

end
