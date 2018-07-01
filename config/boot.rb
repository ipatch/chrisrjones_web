# Set up gems listed in the Gemfile.
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

# set the JS runtime to Nodejs
ENV['EXECJS_RUNTIME'] = 'Node'

require 'bundler/setup' if File.exist?(ENV['BUNDLE_GEMFILE'])
