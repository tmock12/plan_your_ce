class Admins::ProvidersController < AuthenticatedController
  before_filter :require_admin
  expose(:provider)

  def approve
    provider.activate!
    flash.now
    redirect_to :admins_dashboard, notice: "You have approved #{provider.name}"
  end
end
