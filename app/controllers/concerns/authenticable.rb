module Authenticable
	def authorization_token
		@authorization = nil
		if request.headers['Authorization'].present?
			@authorization = request.headers['Authorization']
		elsif request.headers['HTTP_AUTHENTICATION_TOKEN'].present?
			@authorization = request.headers['HTTP_AUTHENTICATION_TOKEN']
		end
	end
  # Devise methods overwrites
	def current_user
		@current_user ||= User.find_by(auth_token: @authorization)
	end

	def authenticate_with_token!
		render json: { errors: "Not authenticated" },  status: :unauthorized unless user_signed_in?
	end

	def user_signed_in?
		current_user.present?
		end
end