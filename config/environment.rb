# frozen_string_literal: true

# Load the Rails application.
# require 'logger'
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

RAILS_DEFAULT_LOGGER = Logger.new("#{Rails.root}/log/#{Rails.env}.log", "daily")
