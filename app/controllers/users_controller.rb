class UsersController < ApplicationController
  before_action :verify_user, except: [:new, :create]

  def new
    @user = User.new
    @user.addresses.build
  end

  def index; end

  def show
    @user = User.find_by id: params[:id]
    @address = @user.addresses.first
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
    if @user.update user_params
      redirect_to @user
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit :name, :password, :email, :avatar, addresses_attributes: [:id, :user_id, :address, :city, :phone]
  end
end
