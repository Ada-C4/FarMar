require "simplecov"
SimpleCov.start

# Here the . means the directory from where we ran RSpec
require "./lib/far_mar"

# FarmMar::Market.CONSTANT_FOR_CSV use a constant to call the CSV then rewrite it.
