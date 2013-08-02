class ProvidersController < ApplicationController
  before_filter :require_user, except: [:new, :create]
  before_filter :require_provider, except: [:new, :create]
  expose(:providers)
  expose(:provider, attributes: :provider_params)
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

  private

  def provider_params
    params.require(
      :provider
    ).permit(
      :name, :phone, :fax, :website, :cerp_number,
      provider_address_attributes:
      [:street_1, :street_2, :city, :state, :zip_code],
      user_attributes:
      [:email, :password, :password_confirmation]
    )
  end

  def require_provider
    redirect_to :dashboard unless current_user.role == "provider"
  end
end
