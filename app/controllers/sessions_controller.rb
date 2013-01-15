class SessionsController < ApplicationController
  expose(:provider) { Provider.find_by_email(params[:email]) }

  def create
    if provider && !provider.activated?
      flash.now[:sign_in_error] = "Your account is pending approval"
      render :new
    elsif provider && provider.authenticate(params[:password])
      sign_in(provider, false)
      redirect_to :courses
    else
      flash.now[:sign_in_error] = "Your email or password are incorrect"
      render :new
    end
  end

  def destroy
    sign_out
    redirect_to :courses, notice: "You are now signed out"
  end

end
