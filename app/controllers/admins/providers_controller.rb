class Admins::ProvidersController < AuthenticatedController
  before_filter :require_admin
  expose(:provider)

  def approve
    provider.activate!
    redirect_to :admins_dashboard, notice: "You have approved #{provider.name}"
  end

  def reject
    provider.reject!
    redirect_to :admins_dashboard, notice: "You have rejected #{provider.name}"
  end
end
