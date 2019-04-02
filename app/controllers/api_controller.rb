class ApiController < ActionController::API
  # rails v5.x
  # protect_from_forgery unless: -> { request.format.json? }


  # rails v4.2
  # protect_from_forgery with: :exception, if: Proc.new { |c| c.request.format != 'application/json' }
  # protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }
end
