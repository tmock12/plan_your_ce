class Provider < ActiveRecord::Base

  belongs_to :user
  has_many :courses, dependent: :destroy
  has_one :provider_address, dependent: :destroy
  alias :address :provider_address

  accepts_nested_attributes_for :provider_address

  attr_accessible :cerp_number,  :fax, :name, :phone,
    :website, :provider_address_attributes, :user_attributes, :user

  before_create :generate_activation_token
  before_create :normalize_phone_number

  validates_plausible_phone :phone
  validates_presence_of :name, :phone, :cerp_number

  def activate!
    self.update_attribute(:activated_at, Time.now)
  end

  def activated?
    activated_at.present?
  end

  def generate_activation_token
    self.activation_token = SecureRandom.urlsafe_base64
  end

  def normalize_phone_number
    self.phone = PhonyRails.normalize_number(phone, country_code: 'US')
  end

end
