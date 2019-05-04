class AddressesController < ApplicationController
  def create
    session[:address_review] = checkout_params_review
    redirect_to checkouts_path
  end

  def update
    @address = Address.find_by id: params[:address_id]
    @address.present? ? @address.destroy : flash[:warning]="address not exist!"
    redirect_to new_checkouts_path
  end

  private

  def checkout_params_review
    params.permit :name, :email, :address, :city, :country, :phone
  end

end
