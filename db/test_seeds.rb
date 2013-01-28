[ ['Tambor, Costa Rica-TMU', 'TMU'],
  ['Fukue, Japan-FUJ', 'FUJ'],
  ['Atlantic City, NJ-ACY', 'ACY'] ]
.each do |title, code|
  Airport.create!(title: title, iata_code: code)
end
