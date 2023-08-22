# frozen_string_literal: true

# Load the Rails application.
require File.expand_path('application', __dir__)

# Initialize the Rails application.
Rails.application.initialize!

RAILS_DEFAULT_LOGGER = Logger.new(Rails.root.join("log/#{Rails.env}.log").to_s, 'daily')
