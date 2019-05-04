class CheckoutsController < ApplicationController
  before_action :check_address, only: [:show, :destroy]
  before_action :check_address_review, only: [:new, :create]
  before_action :checkout_order

  def new
    @address = Address.new
  end

  def show; end

  def create
    @address = Address.new
    if current_user.present?
      @order_address = current_user.addresses.build checkout_params
      @order_address.save ? (redirect_to new_checkouts_path) : (render :new)
    else
      unless params[:address][:email].empty? || params[:address][:phone].empty?
        session[:address] = checkout_params
        redirect_to new_checkouts_path
      else
        flash[:warning] = "email or phone number can't be blank!"
        redirect_to new_checkouts_path
      end
    end
  end

  def edit; end

  def update
    unless params[:email].empty? || params[:phone].empty?
      session[:address_review] = address_params
      redirect_to checkouts_path
    else
      redirect_to edit_checkouts_path
      flash[:warning] = "email or phone number can't be blank!"
    end
  end

  private

  def checkout_params
    params.require(:address).permit :name, :email, :address, :city, :country, :phone
  end

  def address_params
    params.permit :name, :email, :address, :city, :country, :phone
  end

  def check_address
    return if session[:address_review].present?
    redirect_to new_login_checkout_path
  end

end
