module Api
  module V1
    class AuthController < ApiController
   
	   	def login
	   		@user = User.where(email: params[:email].downcase).first
	   		if @user.present? && @user.valid_password?(params[:password])
	   			render_access_token @user
	   		else
	   			raise Api::Error,new('login failed. Email or password is invalid', Api::ErrorCode::AUTHENTICATION_FAILED )
	   		end
		end

		private

		def render_access_token(user)
			render json: {name: user.name, access_token: @user.get_access_token, user_id: @user.id}
		end

    end
  end
end