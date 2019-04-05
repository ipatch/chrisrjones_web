# RSpec
# spec/support/factory_girl.rb

require 'factory_bot'

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
end
