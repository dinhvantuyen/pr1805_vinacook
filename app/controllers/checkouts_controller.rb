class CheckoutsController < ApplicationController
  before_action :check_address, only: [:show, :destroy]
  before_action :check_address_review, only: [:new, :create]
  before_action :check_address_review_exist, only: [:edit, :update]
  before_action :checkout_order

  def new
    @address = Address.new
  end

  def show; end

  def create
    @address = Address.new
    if current_user.present?
      unless params[:address][:email].empty? || params[:address][:phone].empty? ||
        params[:address][:address].empty? || params[:address][:city].empty?
        @order_address = current_user.addresses.build checkout_params
      else
        flash[:warning] = "email, phone, address, city can't be blank!"
        redirect_to new_checkouts_path and return
      end
      @order_address.save ? (redirect_to new_checkouts_path) : (redirect_to new_checkouts_path and return)
    else
      unless params[:address][:email].empty? || params[:address][:phone].empty? ||
        params[:address][:address].empty? || params[:address][:city].empty?
        session[:address] = checkout_params
        redirect_to new_checkouts_path
      else
        flash[:warning] = "email, phone, address, city can't be blank!"
        redirect_to new_checkouts_path
      end
    end
  end

  def edit; end

  def update
    unless params[:email].empty? || params[:phone].empty? || params[:address].empty? || params[:city].empty?
      current_user.present? ? (current_user.addresses.first.update address_params) : nil
      session[:address_review] = address_params
      redirect_to checkouts_path
    else
      redirect_to edit_checkouts_path
      flash[:warning] = "email, phone, address, city can't be blank!"
    end
  end

  private

  def checkout_params
    params.require(:address).permit :name, :email, :address, :city, :country,
    :phone
  end

  def address_params
    params.permit :name, :email, :address, :city, :country, :phone
  end

  def check_address
    return if session[:address_review].present?
    redirect_to new_login_checkout_path
  end

end
