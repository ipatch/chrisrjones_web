# frozen_string_literal: true

# Be sure to restart your server when you modify this file.

# Configure sensitive parameters which will be filtered from the log file.
# Kevin suggests filtering "token" keyword as well the password.
Rails.application.config.filter_parameters += [:password, :token]
