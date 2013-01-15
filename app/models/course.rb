class Course < ActiveRecord::Base
  belongs_to :provider
  has_one :course_address, dependent: :destroy
  alias :address :course_address

  serialize :audience
  accepts_nested_attributes_for :course_address

  attr_accessible :audience, :category, :credits, :description, :email,
    :end_date, :instructor, :max_attendance, :phone, :price, :start_date,
    :title, :course_address_attributes, :provider

  before_create :normalize_phone_number

  validates_presence_of :phone, :title, :description, :audience, :credits, :email
  validates_plausible_phone :phone

  def normalize_phone_number
    self.phone = PhonyRails.normalize_number(phone, country_code: 'US')
  end
end
