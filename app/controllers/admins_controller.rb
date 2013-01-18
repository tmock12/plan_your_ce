class AdminsController < AuthenticatedController
 before_filter :require_admin
  expose(:provider)
  expose(:unaproved_providers) do
    ProviderDecorator.decorate_collection(Provider.unaproved)
  end
end
