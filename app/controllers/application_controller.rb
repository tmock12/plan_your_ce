class ApplicationController < ActionController::Base
  protect_from_forgery
  include Authem::ControllerSupport

  def require_admin
    redirect_to :dashboard unless current_user.role == "admin"
  end
end
