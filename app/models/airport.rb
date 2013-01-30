class Airport < ActiveRecord::Base
  attr_accessible :iata_code, :title

  def self.valid_title?(title)
    find_by_title(title).present?
  end
end
