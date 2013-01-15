class ProviderAddress < Address
  belongs_to :provider
  validates_presence_of :street_1, :city, :state, :zip_code
end
