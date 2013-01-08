class ProvidersController < ApplicationController
  expose(:provider)

  def create
    if provider.save
      redirect_to :thank_you
    else
      render :new
    end
  end
end
