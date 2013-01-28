class Airport < ActiveRecord::Base
  attr_accessible :iata_code, :location
end
