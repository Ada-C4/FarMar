require "csv"
require "pry"

module FarMar
  attr_accessor :id, :name, :address, :city, :county, :state, :zip
  class Market < FarMar::FarMarParent
    def self.filepath
      "./support/markets.csv"
    end

    def self.create_hash(market_array)
      market_hash = {}
      market_hash[:id] = market_array[0].to_i
      market_hash[:name] = market_array[1]
      market_hash[:address] = market_array[2]
      market_hash[:city] = market_array[3]
      market_hash[:county] = market_array[4]
      market_hash[:state] = market_array[5]
      market_hash[:zip] = market_array[6].to_i
      return market_hash
    end

    def find_vendors(market_id)
      vendors_array = []
      FarMar::Vendor.all.each do |vendor|
        if market_id == vendor.market_id
          vendors_array.push(vendor)
        end
      end
        return vendors_array
    end

    def find_products(market_id)
      products_array = []
      vendors = find_vendors(market_id)
      vendors.each do |vendor|
        products = vendor.find_products(vendor.id)
        products_array.push(products)
      end
      return products_array.flatten
    end

  end
end
