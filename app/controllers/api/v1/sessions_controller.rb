class Api::V1::SessionsController < ApplicationController
  skip_before_action :authenticate_with_token!, :except => [:destroy]
  skip_before_action :authorization_token, :set_time_zone
  respond_to :json
  
  swagger_controller :sessions, "User Sessions"
    swagger_api :create do
      summary "Creates a new User login session"
    param :form, :email, :string, :required, "Email address"
    param :form, :password, :string, :required, "Password"
    response :unauthorized
    response :not_acceptable
  end

  swagger_api :destroy do
    summary "Deletes user login session"
    param :header, 'Authentication-Token', :string, :required, 'Authentication token'
    response :unauthorized
    response :not_acceptable
  end

  def create
    user_password = params[:password]
    user_email = params[:email]
    user = user_email.present? && User.find_by!(email: user_email)
    if user.valid_password? user_password
      sign_in user, store: false
      user.generate_authentication_token!
      user.save
      render json: user, status: 200, location: [:api, user]
    else
      render json: { errors: "Invalid email or password" }, status: 422
    end
  end  

  def destroy
    current_user.generate_authentication_token!
    current_user.save
    head 204
  end  
end