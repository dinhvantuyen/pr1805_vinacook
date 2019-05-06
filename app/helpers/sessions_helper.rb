module SessionsHelper

  def log_in user
    session[:user_id] = user.id
  end

  def remember user
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  def current_user
    if user_id = session[:user_id]
      @current_user ||= User.find_by id: session[:user_id]
    elsif user_id = cookies.signed[:user_id]
      user = User.find_by id: user_id
      if user && user.authenticated?(:remember, cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end
  end

  def logged_in?
    current_user.present?
  end

  def forget user
    user.forget
    cookies.delete :user_id
    cookies.delete :remember_token
  end

  def log_out
    session.delete :user_id
    @current_user = nil
  end

  def checkout_complete
    session.delete :order_id
    session.delete :address_review
    session.delete :address
    current_order = nil
  end

  def checkout_order
    return unless current_order.product_orders.empty?
    redirect_to root_url
  end

  def check_address_review
    return if session[:address_review].nil?
    redirect_to checkouts_path
  end

  def check_address_review_exist
    return if session[:address_review].present?
    redirect_to new_checkouts_path
  end

  def categories_for_search
    @categories_for_search = Category.pluck :name, :id
  end

  def verify_user
    @user = User.find_by id: params[:id]
    return if @user && @user == current_user
    redirect_to root_url
  end

end
