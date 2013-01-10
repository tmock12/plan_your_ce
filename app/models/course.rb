class Course < ActiveRecord::Base
  belongs_to :provider
  serialize :audience

  attr_accessible :street_address_1, :street_address_2, :audience, :category, :city, :credits, :description, :email, :end_date, :instructor, :max_attendance, :phone, :price, :start_date, :state, :title, :zip_code
end
