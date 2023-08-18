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
      user = find_user_by_email
      return invalid_credentials unless user_authenticated?(user)

      auth_token = generate_auth_token(user)
      return authentication_failed(user.email) unless save_auth_token(user, auth_token)

      json_response(auth_token:)
    end

    def check_authentication
      render json: { authenticated: current_user.present? }
    end

    def logout
      token = request.headers['Authorization']

      if TokenBlacklist.exists?(jwt_token: token)
        render_token_revoked_error
      else
        blacklist_token(token)
        clear_jwt_token_for_user
        render_logout_success
      end
    end

    private

    def render_token_revoked_error
      render json: { error: 'Token revoked' }, status: :unauthorized
    end

    def blacklist_token(token)
      TokenBlacklist.create(jwt_token: token, expiring_at: 1.day.from_now)
    end

    def clear_jwt_token_for_user
      return if current_user.blank?

      current_user.jwt_token = nil
      current_user.save ? nil : render_logout_failed_error
    end

    def render_logout_success
      render json: { message: 'rails api logout successful' }, status: :ok
    end

    def render_logout_failed_error
      render json: { error: 'Logout failed' }, status: :unprocessable_entity
    end

    def find_user_by_email
      User.find_by(email: auth_params[:email])
    end

    def user_authenticated?(user)
      user&.authenticate(auth_params[:password])
    end

    def generate_auth_token(user)
      JsonWebToken.encode(user_id: user.id)
    end

    def save_auth_token(user, auth_token)
      user.update(jwt_token: auth_token)
    end

    def invalid_credentials
      logger.error("Authentication Failed: Invalid credentials for email #{auth_params[:email]}")
      json_response({ error: 'invalid credentials' }, :unauthorized)
    end

    def authentication_failed(email)
      logger.error("Authentication Failed: Invalid credentials for email #{email}")
      json_response({ error: 'invalid credentials' }, :unauthorized)
    end

    def auth_params
      # params.require(:authentication).permit(:email, :password)
      params.permit(:email, :password)
    end
  end
end
