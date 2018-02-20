class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  protect_from_forgery with: :null_session
	# before_action :authenticate_user!
	before_action :authorization_token
	protected
	def devise_parameter_sanitizer
		if resource_class == User
			User::ParameterSanitizer.new(User, :user, params)
		else
      		super # Use the default one
    	end
  	end

  	def authorization_token
  		if request.headers['Authorization'].present?
  			@authorization = request.headers['Authorization']
  		elsif request.headers['HTTP_AUTHENTICATION_TOKEN'].present?
  			@authorization = request.headers['HTTP_AUTHENTICATION_TOKEN']
  		end
  	end
end
