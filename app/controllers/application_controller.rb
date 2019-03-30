class ApplicationController < ActionController::Base
  include SessionsHelper
  protect_from_forgery with: :exception
  helper_method :current_order

  def current_order
    session[:order_id].present? ? Order.find_by(id: session[:order_id]) : Order.new
  end
end
