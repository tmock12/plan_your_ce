class Admin < ActiveRecord::Base

  belongs_to :user, dependent: :destroy

  delegate :email, to: :user

  accepts_nested_attributes_for :user

  attr_accessible :user_attributes
end
