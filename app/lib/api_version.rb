# frozen_string_literal: true

# add more descriptive top level comment
class ApiVersion
  attr_reader :version, :default

  def initialize(version, default: false)
    @version = version
    @default = default
  end

  # check whether version is specified or is default
  def matches?(request)
    check headers(request.headers) || default
  end

  private

  def check_headers(headers)
    # check version from Accept headers; expect custom media type `todos`
    accept = headers[:accept]
    accept&.include?("application/vnd.articles.#{version}+json")
  end
end
