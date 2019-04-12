class Admin::BaseController < ActionController::Base
  layout "admin/application"
  before_action :logged_in_admin
  before_action :admin_user
  include Admin::SessionsHelper

  def admin_user
    redirect_to root_url unless current_admin.admin?
  end

  def logged_in_admin
    unless logged_in?
      redirect_to admin_login_url
    end
  end
end
