class SessionsController < ApplicationController

  def new; end

  def create
    @user = User.find_by email: params[:session][:email]
    if @user && @user.authenticate(params[:session][:password])
      flash[:success] = "Dang nhap thanh cong!"
      log_in @user
      params[:session][:remember_me] == '1' ? remember(@user) : forget(@user)
      redirect_to @user
    else
      flash[:warning] = "Dang nhap khong thanh cong!"
      render :new
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
