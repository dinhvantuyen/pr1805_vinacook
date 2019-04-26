class LoginCheckoutsController < ApplicationController
  before_action :check_login, only: [:new, :create]
  before_action :checkout_order, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    user = User.find_by email: params[:session][:email]
    if user && user.authenticate(params[:session][:password])
      if user.activated?
        log_in user
        redirect_to new_checkout_path
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

  private

  def check_login
    return unless logged_in?
    redirect_to new_checkout_path
  end

end
