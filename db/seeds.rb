File.read(File.join(Rails.root, "db/airportcodes.txt")).each_line do |line|
  location = line.strip
  code = line.split('-').last.strip
  Airport.create!(location: location, iata_code: code)
end
