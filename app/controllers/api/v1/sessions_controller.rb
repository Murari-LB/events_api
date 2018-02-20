class Api::V1::SessionsController < DeviseController
	
  def create
    @user_email = request.headers[:email].to_s
    @user_password = request.headers[:password].to_s
    @user = User.find_by(email: @user_email) if @user_email.present?
    @errors = []
    if @user.present? && @user.valid_password?(@user_password) && !@authorization.present?
      @user.generate_authentication_token!
      if @user.save
        render json: { data: @user, message: "Signed in successfully" }
      else
        @errors = @user.errors.present? ? @user.errors : "Invalid Email or password"
        render json: { data: @errors, message: "Could not sign in" }
      end
    else
      @errors = "Please provide username and password or something went wrong"
      render json: { data: @errors, message: "Could not sign in" }
    end
  end

  def destroy
    user = User.find_by(authentication_token: @authorization)
    user.generate_authentication_token!
    user.save
    render json: { data: user, message: "Signed out successfully" }
  end

end
