require "simplecov"
SimpleCov.start

# Here the . means the directory from where we ran RSpec
require "./lib/far_mar"

FarMar::Market::CSV_FILE = "./support/sample_markets.csv"
FarMar::Vendor::CSV_FILE = "./support/sample_vendors.csv"
FarMar::Product::CSV_FILE = "./support/sample_products.csv"
FarMar::Sale::CSV_FILE = "./support/sample_sales.csv"

RSpec.configure do |config|
 config.order = 'random'
end
