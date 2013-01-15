class Address < ActiveRecord::Base
  attr_accessible :city, :state, :street_1, :street_2, :zip_code
end
