# frozen_string_literal: true

module Api
  # Controller for handling user authentication and authorization.
  class AuthenticationController < ApiController
    before_action :authorize_request, except: :authenticate
    skip_before_action :authorize_request, only: %i[authenticate logout check_authentication]

    # include AuthenticateUser and necessary modules
    include Response
    include ExceptionHandler

    # return auth token once user is authenticated
    def authenticate
      # binding.pry
      user = User.find_by(email: auth_params[:email])

      if user&.authenticate(auth_params[:password])
        auth_token = JsonWebToken.encode(user_id: user.id)
        user.update_column(:jwt_token, auth_token)
        json_response(auth_token:)
      else
        logger.error("Authentication Failed: Invalid credentials for email #{auth_params[:email]}")
        json_response({ error: 'invalid credentials' }, :unauthorized)
      end
    end

    def check_authentication
      render json: { authenticated: current_user.present? }
    end

    def logout
      token = request.headers['Authorization']
      if TokenBlacklist.exists?(jwt_token: token)
        render json: { error: 'Token revoked' }, status: :unauthorized
      else
        TokenBlacklist.create(jwt_token: token, expiring_at: 1.day.from_now)

        # Clear the jwt_token for the current user if authenticated
        if current_user.present?
          current_user.update_column(:jwt_token, nil)
          # TODO: ipatch this is kindof a hack to fix logout issue of unauthorized 401
        end
        render json: { message: 'rails api logout successful' }, status: :ok
      end
    end

    private

    def auth_params
      # params.require(:authentication).permit(:email, :password)
      params.permit(:email, :password)
    end
  end
end
