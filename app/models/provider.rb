class Provider < ActiveRecord::Base
  include Authem::User

  attr_accessible :cerp_number, :city, :state, :email, :fax, :name, :phone,
    :state, :street_address_1, :street_address_2, :website, :zip_code

  validates_presence_of :name, :street_address_1, :city, :state, :zip_code,
    :phone, :email, :cerp_number
end
