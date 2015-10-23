require "simplecov"
SimpleCov.start
require "pry"
require "./lib/far_mar"

# randomize running of specs
RSpec.configure do |config|
 config.order = 'random'
end
