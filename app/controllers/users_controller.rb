class UsersController < ApplicationController

  def show
    @user = User.find_by id: params[:id]
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find_by id: params[:id]
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Chào mừng bạn đã đến wwebsite VINACOOK!"
      redirect_to root_url
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit :name, :address, :email, :phone, :password
  end
end
