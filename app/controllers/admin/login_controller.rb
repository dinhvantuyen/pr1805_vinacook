class Admin::LoginController < Admin::BaseController
  skip_before_action :logged_in_admin
  before_action :admin_user, only: :destroy
  layout "admin/application1"

  def show
    @admin = User.find_by id: params[:id]
  end

  def new
    @admin = User.new
  end

  def edit
    @admin = User.find_by id: params[:id]
  end

  def create
    @admin = User.find_by email: params[:session][:email]
    if @admin && @admin.authenticate(params[:session][:password])
      flash[:success] = "Dang nhap thanh cong!"
      log_in @admin
      params[:session][:remember_me] == '1' ? remember(@admin) : forget(@admin)
      if current_admin.admin?
        redirect_to admin_root_path
      else
        redirect_to root_path
      end
    else
      flash[:warning] = "Dang nhap khong thanh cong!"
      render :new
    end
  end

  def destroy
    log_out
    redirect_to admin_login_url
  end

  def help; end


end
