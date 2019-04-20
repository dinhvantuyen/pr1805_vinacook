class Admin::UsersController < Admin::BaseController
  before_action :load_user, except: [:index, :new, :create]
  def index
    @user = User.paginate page: params[:page], per_page: 25
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success]= "Tao tai khoan thanh cong"
      redirect_to admin_users_path
    else
      render :new
    end

  end

  def show;end

  def edit;end

  def update
    # byebug
    if @user.update_attributes user_params
      flash[:success] = "Cập nhật thành công"
      redirect_to admin_users_path
    else
      flash[:danger] = "Cập nhật không thành công"
      render :edit
    end
  end

  def destroy
    @user.destroy
    flash[:success] = "Đã xóa hãng thành công"
    redirect_to admin_users_path
  end

  private
  def user_params
    params.require(:user).permit :name, :address, :email, :phone, :password, :role
  end
  def load_user
    @user = User.find_by id: params[:id]
  end
end

