class Course < ActiveRecord::Base
  belongs_to :provider
  serialize :audience

  attr_accessible :audience, :category, :credits, :description, :email, :end_date, :instructor, :max_attendance, :phone, :price, :start_date, :title, :course_address_attributes, :provider

end
