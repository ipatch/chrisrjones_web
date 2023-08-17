# frozen_string_literal: true

#
# NOTE: ipatch
# https://guides.rubyonrails.org/v5.2/initialization.html

ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __dir__)

require 'bundler/setup' # Set up gems listed in the Gemfile.

# Find the next available port starting from 3001
require 'socket'

def next_available_port
  port = 3000
  # Get the local IP address dynamically
  local_ip = Socket.ip_address_list.detect(&:ipv4_private?).ip_address
  while port <= 65_535
    return port if port_available?(local_ip, port)

    port += 1
  end
  nil
end

# Check if a specific port is available
def port_available?(ip, port)
  server = TCPServer.new(ip, port)
  server.close
  true
rescue Errno::EADDRINUSE
  false
end

# Set the Rails server port to the next available port
port = next_available_port
if port
  puts { "Using port #{port}..." }
  ENV['PORT'] = port.to_s
  ENV['BINDING'] = '0.0.0.0'
else
  puts 'No available ports found, using default 3000...'
end
