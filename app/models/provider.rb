class Provider < ActiveRecord::Base
  include Authem::User

  attr_accessible :cerp_number, :city, :state, :email, :fax, :name, :phone,
    :state, :street_address_1, :street_address_2, :website, :zip_code
end
