
require "simplecov"
SimpleCov.start

require "./lib/far_mar"

RSpec.configure do |config|
 config.order = 'random'
end

RSpec.configure do |config|
  config.after(:suite) do
    num_failed = RSpec.world
                      .filtered_examples
                      .values
                      .flatten
                      .count(&:exception)

    if num_failed == 0
      `say "You did it Lauren! You're amazing!"`
    else
      `say "Keep going! Only #{num_failed} #{num_failed > 1 ? "tests" : "test"} to go!"`
    end
  end
end
