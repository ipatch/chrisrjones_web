# Set up gems listed in the Gemfile.
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

# set the JS runtime to Nodejs
ENV['EXECJS_RUNTIME'] = 'Node'

require 'bundler/setup' if File.exist?(ENV['BUNDLE_GEMFILE'])

# DEV > `rails s` over LAN
require 'rails/commands/server'
module Rails
  class Server
    def default_options
      super.merge(Host: '0.0.0.0', Port: 3000)
    end
  end
end
