class AdminsController < ApplicationController
  before_filter :require_user
  before_filter :require_admin

  private

  def require_admin
    redirect_to :dashboard unless current_user.role == "admin"
  end
end
