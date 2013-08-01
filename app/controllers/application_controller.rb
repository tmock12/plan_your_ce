class ApplicationController < ActionController::Base
  protect_from_forgery
  include Authem::ControllerSupport

  # While under development us http basic authenticate
  # before_filter :authenticate

  protected

  # def authenticate
  #   authenticate_or_request_with_http_basic do |username, password|
  #     username == "taylor" && password == "letmein"
  #   end
  # end
end
