class DashboardController < ApplicationController
  before_filter :require_user, except: [:new, :create]

  def index
    case current_user.role
    when "admin" then redirect_to :admin_dashboard
    when "provider" then redirect_to :provider_dashboard
    end
  end

end
