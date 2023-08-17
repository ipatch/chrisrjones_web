# frozen_string_literal: true

module Response # :nodoc:
  extend ActiveSupport::Concern

  def json_response(object, status = :ok)
    render json: object, status:
  end
end
