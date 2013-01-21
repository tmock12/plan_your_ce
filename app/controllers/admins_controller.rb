class AdminsController < AuthenticatedController
 before_filter :require_admin
  expose(:provider)
  expose(:scope) { params[:scope] ||= "unapproved" }
  expose(:providers) do
    ProviderDecorator.decorate_collection(Provider.send(scope))
  end
end
