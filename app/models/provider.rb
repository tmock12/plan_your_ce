class Provider < ActiveRecord::Base
  include Authem::User

  attr_accessible :cerp_number, :city, :state, :email, :fax, :name, :phone,
    :state, :street_address_1, :street_address_2, :website, :zip_code

  before_create :generate_activation_token

  validates_presence_of :name, :street_address_1, :city, :state, :zip_code,
    :phone, :email, :cerp_number

  def activate!
    self.update_attribute(:activated_at, Time.now)
  end

  def activated?
    activated_at.present?
  end

  def generate_activation_token
    self.activation_token = SecureRandom.urlsafe_base64
  end
end
