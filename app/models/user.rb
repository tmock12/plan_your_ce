class User < ActiveRecord::Base
  include Authem::User

  attr_accessible :email, :password_digest, :session_token, :provider

  validates_presence_of :email
end
