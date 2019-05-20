# frozen_string_literal: true

# disable output buffering
$stdout.sync = true

# Set up gems listed in the Gemfile.
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('Gemfile', __dir__)

# set the JS runtime to Nodejs
ENV['EXECJS_RUNTIME'] = 'Node'

require 'bundler/setup' if File.exist?(ENV['BUNDLE_GEMFILE'])

# DEV > `rails s` over LAN
require 'rails/commands/server'
module Rails
  # setup Server class for overriding default `rails s` options
  class Server
    def default_options
      super.merge(Host: '0.0.0.0', Port: 3000)
    end
  end
end
