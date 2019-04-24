class CheckoutsController < ApplicationController

  def new
    @address = Address.new
  end

  def create
    @address = Address.new
    if current_user.present?
      @order_address = current_user.addresses.build checkout_params
      @order_address.save
    else
      session[:address] = checkout_params
    end
    redirect_to new_checkout_path
  end

  def edit; end

  private

  def checkout_params
    params.require(:address).permit :name, :email, :address, :city, :country, :phone
  end
end
