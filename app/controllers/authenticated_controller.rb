class AuthenticatedController < ApplicationController
  before_filter :require_user

  def require_admin
    redirect_to :dashboard unless current_user.role == "admin"
  end

end
