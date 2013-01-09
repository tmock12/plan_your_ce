class SessionsController < ApplicationController
  expose(:provider) { Provider.find_by_email(params[:email]) }

  def create
    if provider && !provider.activated?
      flash.now[:sign_in_error] = "Your account is pending approval"
      render :new
    end
  end
end
