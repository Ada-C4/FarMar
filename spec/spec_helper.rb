require 'simplecov'
SimpleCov.start

require "./lib/far_mar"

RSpec.configure do |config|
 config.order = 'random'
end
