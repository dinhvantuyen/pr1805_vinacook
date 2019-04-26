class CheckoutsController < ApplicationController
  before_action :check_address, except: [:new, :create, :edit, :update]
  before_action :checkout_order, except:
  def new
    @address = Address.new
  end

  def index; end

  def create
    @address = Address.new
    if current_user.present?
      @order_address = current_user.addresses.build checkout_params
      @order_address.save ? (redirect_to new_checkout_path) : (render :new)
    else
      session[:address] = checkout_params
      redirect_to new_checkout_path
    end
  end

  private

  def checkout_params
    params.require(:address).permit :name, :email, :address, :city, :country, :phone
  end

  def check_address
    return if session[:address_review].present?
    redirect_to new_login_checkout_path
  end

end
