# frozen_string_literal: true

# app/services/authorize_api_request.rb
#
# This class is responsible for authorizing API requests by decoding and verifying JSON Web Tokens (JWTs).
# It extracts the user's ID from the token and retrieves the corresponding user record from the database.
# If the token is valid and the user exists, the class returns a valid user object.
class AuthorizeApiRequest
  def initialize(headers = {})
    @headers = headers
  end

  # Service entry point - return valid user object
  def call
    {
      user:
    }
  end

  private

  attr_reader :headers

  def user
    @user ||= User.find(decoded_auth_token[:user_id]) if decoded_auth_token
  rescue ActiveRecord::RecordNotFound => e
    raise ExceptionHandler::InvalidToken, "#{Message.invalid_token} #{e.message}"
  end

  def decoded_auth_token
    @decoded_auth_token ||= JsonWebToken.decode(http_auth_header)
  end

  def http_auth_header
    return @headers['Authorization'].split.last if @headers['Authorization'].present?

    raise ExceptionHandler::MissingToken, Message.missing_token
  end
end
