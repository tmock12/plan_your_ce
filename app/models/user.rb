class User < ActiveRecord::Base
  include Authem::User
  has_one :provider, dependent: :destroy

  attr_accessible :email, :password_digest, :session_token, :provider

  validates_presence_of :email
end
