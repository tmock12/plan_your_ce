class Provider < ActiveRecord::Base
  include Authem::User

  has_many :courses


  attr_accessible :cerp_number, :email, :fax, :name, :phone, 
    :website, :provider_address_attributes

  before_create :generate_activation_token
  before_create :normalize_phone_number

  validates_plausible_phone :phone
  validates_presence_of :name, :phone, :email, :cerp_number

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
