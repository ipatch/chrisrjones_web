# frozen_string_literal: true

# disable output buffering
$stdout.sync = true

# Set up gems listed in the Gemfile.
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __dir__)

# set the JS runtime to Nodejs
ENV['EXECJS_RUNTIME'] = 'Node'

# Find the next available port starting from 3001
require 'socket'

def next_available_port
  port = 3001
  while port <= 65535
    return port if port_available?(port)
    port += 1
  end
  nil
end

# Check if a specific port is available
def port_available?(port)
  begin
    server = TCPServer.new('127.0.0.1', port)
    server.close
    true
  rescue Errno::EADDRINUSE
    false
  end
end

# Set the Rails server port to the next available port
port = next_available_port
if port
  puts "Using port #{port}..."
  ENV['PORT'] = port.to_s
else
  puts "No available ports found, using default 3000..."
end

require 'bundler/setup' if File.exist?(ENV['BUNDLE_GEMFILE'])

require 'rails/command'
require 'rails/commands/server/server_command'

# DEV / `rails s` over LAN
# require 'rails/commands/server' # NOTE: does not work with rails ≥ 5.1
module Rails
  # setup Server class for overriding default `rails s` options
  class Server
    def default_options
      super.merge(Host: '0.0.0.0', Port: 3000)
    end
  end
end

