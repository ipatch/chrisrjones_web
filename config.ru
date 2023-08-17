# frozen_string_literal: true

# This file is used by Rack-based servers to start the application.

# environment 'production'

# require 'logger'
require File.expand_path('config/environment', __dir__)
run CrjCom::Application
