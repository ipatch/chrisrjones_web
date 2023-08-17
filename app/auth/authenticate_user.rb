# frozen_string_literal: true

# app/services/authenticate_user.rb
#
# This class handles user authentication by validating email and password credentials.
# If valid credentials are provided, a JSON web token (JWT) is generated for the user,
# allowing them access to authenticated parts of the application.
class AuthenticateUser
  # include 'message' # searches for a `module`
  # include Message # search for a `class`

  def initialize(email, password)
    @email = email
    @password = password
  end

  # Service entry point
  def call
    JsonWebToken.encode(user_id: user.id) if user
  end

  private

  attr_reader :email, :password

  # verify user credentials
  def user
    user = User.find_by(email:)
    return user if user&.authenticate(password)

    # raise Authentication error if credentials are invalid
    raise(ExceptionHandler::AuthenticationError, Message.invalid_credentials)
  end
end
