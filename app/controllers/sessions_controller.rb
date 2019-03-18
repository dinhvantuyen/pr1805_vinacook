class SessionsController < ApplicationController
  before_action :log_in_user, only: [:new, :create]

  def new; end

  def create
    @user = User.find_by email: params[:session][:email]
    if @user && @user.authenticate(params[:session][:password])
      flash[:success] = "Dang nhap thanh cong!"
      log_in @user
      params[:session][:remember_me] == 'on' ? remember(@user) : forget(@user)
      redirect_to root_url
    else
      flash[:warning] = "Dang nhap khong thanh cong!"
      render :new
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
  private

  def log_in_user
    return unless logged_in?
    redirect_to current_user
  end

end
