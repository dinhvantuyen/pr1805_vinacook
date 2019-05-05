class UsersController < ApplicationController
  before_action :verify_user, only: [:show, :edit, :update]

  def show
    @user = User.find_by id: params[:id]
    @address = @user.addresses.first
  end

  def new
    @user = User.new
    @user.addresses.build
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

  def edit
    @user = User.find_by id: params[:id]
    @address = @user.addresses.first
  end

  def update
    @user = User.find_by id: params[:id]
    @user.update user_params
    redirect_to @user
  end

  private

  def user_params
    params.require(:user).permit :name, :password, :email, :avatar, addresses_attributes: [:id, :address, :city, :phone]
  end
end
