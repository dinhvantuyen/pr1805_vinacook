class SessionsController < ApplicationController
  before_action :log_in_user, only: [:new, :create]

  def new
    @user = User.new
    @user.addresses.build
  end

  def create
    @user = User.new
    user = User.find_by email: params[:session][:email]
    if user && user.authenticate(params[:session][:password])
      if user.activated?
        log_in user
        params[:session][:remember_me] == "on" ? remember(user) : forget(user)
        redirect_to user
      else
        message  = "Account not activated. "
        message += "Check your email for the activation link."
        flash[:warning] = message
        redirect_to root_url
      end
    else
      flash.now[:danger] = "Invalid email/password combination"
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
  private

  def log_in_user
    return unless logged_in?
    redirect_to current_user
  end
end
