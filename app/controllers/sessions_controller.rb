class SessionsController < ApplicationController
  expose(:user) { User.find_by_email(params[:email]) }
  expose(:provider) { Provider.find_by_user_id(user) }

  def create
    if provider && !provider.activated?
      flash.now[:sign_in_error] = "Your account is pending approval"
      render :new
    elsif user && user.authenticate(params[:password])
      sign_in(user, false)
      redirect_to :dashboard
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
