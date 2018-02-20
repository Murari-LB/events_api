class Api::V1::UsersController < ApplicationController
  before_action :set_user

  def show
    render json: @user.as_json, status: 200
  end

  def destroy
      @user.destroy
      head :no_content
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def registration_params
    params.permit(:username, :email, :password, :password_confirmation)
  end
end