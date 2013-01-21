class Admins::ProvidersController < AuthenticatedController
  before_filter :require_admin
  expose(:provider)

  def approve
    provider.activate!
    ProviderMailer.account_activated(provider).deliver
    redirect_to :admins_dashboard, notice: "You have approved #{provider.name}"
  end

  def reject
    provider.reject!
    ProviderMailer.account_rejection(provider, params[:comment]).deliver
    redirect_to :admins_dashboard, notice: "You have rejected #{provider.name}"
  end
end
