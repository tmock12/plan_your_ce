[ ['Tambor, Costa Rica-TMU', 'TMU'],
  ['Fukue, Japan-FUJ', 'FUJ'],
  ['Atlanta, GA-ATL', 'ATL'],
  ['Jacksonville, FL-JAX', 'JAX'],
  ['Atlantic City, NJ-ACY', 'ACY'] ]
.each do |title, code|
  Airport.create!(title: title, iata_code: code)
end
