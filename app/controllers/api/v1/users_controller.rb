class Api::V1::UsersController < ApplicationController
	before_action :set_user, only:[:edit,:show,:update]
	def create
		user = User.new(registration_params)
		if user.save
			render json: user, status: 201
		else
			render json: { errors: user.errors }, status: 422
		end
	end

	def update
    if @current_user.update(update_params)
      render json: @current_user, status: 202
    else
      render json: { errors: current_user.errors }, status: 422
    end
  end

  def forgot_password
    user_email = params[:email]
    user = user_email.present? && User.find_by(email: user_email)
    if user.present?
      user.send_reset_password_instructions
    else
      render :json => { errors: 'Please enter valid email.'}
    end
  end

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