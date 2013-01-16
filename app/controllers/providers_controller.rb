class ProvidersController < ApplicationController
  expose(:provider)
  expose(:courses) { current_user.courses }

  def new
    provider.build_provider_address
  end

  def create
    if provider.save
      redirect_to :thank_you
    else
      render :new
    end
  end
end
