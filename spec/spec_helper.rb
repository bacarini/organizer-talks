lib_path = File.expand_path("../../lib", __FILE__)
Dir["#{lib_path}/**/*.rb"].each { |f| require f }

require "pry"
RSpec.configure do |config|
  config.mock_with :rspec
  config.expect_with :rspec
end
