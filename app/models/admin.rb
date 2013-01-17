class Admin < ActiveRecord::Base

  belongs_to :user, dependent: :destroy

  accepts_nested_attributes_for :user

  attr_accessible :user_attributes
end
