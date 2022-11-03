class Api::V1::CustomersController < ApplicationController
  def create
    new_user = Customer.new(user_params)
    if new_user.save
      render status: 201
    else
      render json: { error: 'Duplicate Customer Email' }, status: 401
    end
  end

  private
  def user_params
    params.permit(:last_name, :first_name, :email, :address)
  end
end