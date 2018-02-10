# This file is used by Rack-based servers to start the application.

# environment 'production'

require ::File.expand_path('../config/environment',  __FILE__)
run CrjCom::Application
