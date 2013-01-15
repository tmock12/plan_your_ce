class Course < ActiveRecord::Base
  belongs_to :provider
  has_one :course_address
  alias :address :course_address

  serialize :audience
  accepts_nested_attributes_for :course_address

  attr_accessible :audience, :category, :credits, :description, :email, :end_date, :instructor, :max_attendance, :phone, :price, :start_date, :title, :course_address_attributes, :provider

end
