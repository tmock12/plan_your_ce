File.read(File.join(Rails.root, "db/airportcodes.txt")).each_line do |line|
  title = line.strip
  code = line.split('-').last.strip
  Airport.create!(title: title, iata_code: code)
end
