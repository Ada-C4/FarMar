require "simplecov"
SimpleCov.start

RSpec.configure do |config|
 config.order = 'random'
end

require "./lib/far_mar"