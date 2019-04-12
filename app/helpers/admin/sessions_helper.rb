module Admin::SessionsHelper

  def log_in admin
    session[:admin_id] = admin.id
  end

  def remember admin
    admin.remember
    cookies.permanent.signed[:admin_id] = admin.id
    cookies.permanent[:remember_token] = admin.remember_token
  end

  def current_admin
    if admin_id = session[:admin_id]
      @current_admin ||= User.find_by id: session[:admin_id]
    elsif admin_id = cookies.signed[:admin_id]
      admin = User.find_by id: admin_id
      if admin && User.authenticated?(cookies[:remember_token])
        log_in admin
        @current_admin = admin
      end
    end
  end

  def logged_in?
    current_admin.present?
  end

  def forget admin
    admin.forget
    cookies.delete :admin_id
    cookies.delete :remember_token
  end

  def log_out
    session.delete :admin_id
    @current_admin = nil
  end

  def login_admin
    redirect_to root_path if logged_in?
  end

  def verify_admin? user
    user == current_admin
  end

end
