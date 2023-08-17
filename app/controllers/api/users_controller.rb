# frozen_string_literal: true

module Api
  class UsersController < ApiController
    skip_before_action :authorize_request, only: :create

    include Response # `./app/controllers/concerns/`
    include ExceptionHandler # `./app/controllers/concerns/`

    # POST /api/signup
    # return authenticated token upon signup
    def create
      user = User.create!(user_params)
      auth_token = AuthenticateUser.new(user.email, user.password).call
      response = { message: Message.account_created, auth_token: }
      json_response(response, :created)
    end

    private

    def user_params
      params.permit(
        :name,
        :email,
        :password,
        :password_confirmation
      )
    end
  end
end
