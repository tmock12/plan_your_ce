class Admins::ProvidersController < AuthenticatedController
  before_filter :require_admin
  expose(:provider)
  expose(:scope) { params[:scope] ||= "all" }
  expose(:providers) do
    ProviderDecorator.decorate_collection(Provider.send(scope))
  end

  def approve
    provider.activate!
    ProviderMailer.account_activated(provider).deliver
    redirect_to admins_providers_scoped_path(:unapproved), notice: "You have approved #{provider.name}"
  end

  def reject
    provider.reject!
    ProviderMailer.account_rejection(provider, params[:comment]).deliver
    redirect_to admins_providers_scoped_path(:unapproved), notice: "You have rejected #{provider.name}"
  end
end
