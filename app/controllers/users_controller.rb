class UsersController < ApplicationController

  def show
    @user = User.find_by id: params[:id]
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find_by id: current_user.id
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash[:success] = "Please check your email to activate your account"
      redirect_to root_url
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit :name, :password, :email, addresses_attributes: [:address, :city, :phone]
  end
end
