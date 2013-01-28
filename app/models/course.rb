class Course < ActiveRecord::Base
  belongs_to :provider
  belongs_to :airport
  has_one :course_address, dependent: :destroy
  alias :address :course_address

  scope :active, where("end_date >= ?", Date.today).order("end_date")
  scope :inactive, where("end_date < ?", Date.today).order("end_date DESC")

  serialize :audience
  accepts_nested_attributes_for :course_address

  attr_accessible :audience, :category, :credits, :description, :email,
    :end_date, :instructor, :max_attendance, :phone, :price, :start_date,
    :title, :course_address_attributes, :provider, :airport, :airport_title
  attr_accessor :airport_title

  before_create :normalize_phone_number

  validates_presence_of :phone, :title, :description, :audience, :credits, :email,
    :start_date, :end_date
  validates :airport_title,
    presence: { message: "must be a valid airport" },
    inclusion: { in: proc { Airport.all.map(&:title) }}
  validates_plausible_phone :phone
  validate :start_must_be_before_end_date

  def start_must_be_before_end_date
    errors.add(:start_date, "must be before end date") unless
    self.start_date <= self.end_date
  end

  def normalize_phone_number
    self.phone = PhonyRails.normalize_number(phone, country_code: 'US')
  end

  def airport_title
    airport.try(:title)
  end

  def airport_title=(title)
    self.airport = Airport.find_by_title(title) if title.present?
  end

end
