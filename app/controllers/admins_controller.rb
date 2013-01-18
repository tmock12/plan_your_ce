class AdminsController < ApplicationController
  before_filter :require_user
  before_filter :require_admin
  expose(:unaproved_providers) do
    ProviderDecorator.decorate_collection(Provider.unaproved)
  end


  private

  def require_admin
    redirect_to :dashboard unless current_user.role == "admin"
  end
end
