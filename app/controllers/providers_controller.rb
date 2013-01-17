class ProvidersController < ApplicationController
  before_filter :require_user, except: [:new, :create]
  expose(:provider) do
    if current_user
      Provider.find_by_user_id(current_user)
    else
      Provider.new(params[:provider])
    end
  end
  expose(:courses) { provider.courses }

  def new
    provider.build_provider_address
    provider.build_user
  end

  def create
    if provider.save
      provider.user.set_role!("provider")
      redirect_to :thank_you
    else
      render :new
    end
  end
end
