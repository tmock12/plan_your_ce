class Admins::ProvidersController < AuthenticatedController
  before_filter :require_admin
  expose(:provider)
  expose(:providers)
  expose(:deco_providers) { ProviderDecorator.decorate_collection(providers) }
  expose(:approved_providers) { Provider.approved.decorate }
  expose(:unapproved_providers) { Provider.unapproved.decorate }

  def approve
    provider.activate!
    ProviderMailer.account_activated(provider).deliver
    redirect_to :unapproved_admins_providers, notice: "You have approved #{provider.name}"
  end

  def reject
    provider.reject!
    ProviderMailer.account_rejection(provider, params[:comment]).deliver
    redirect_to :unapproved_admins_providers, notice: "You have rejected #{provider.name}"
  end
end
