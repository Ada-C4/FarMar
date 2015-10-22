module FarMar
  class Market < FarMar_Base
    attr_reader :id, :name, :address, :city, :county, :state, :zip
    FILENAME = './support/markets.csv'

    def initialize(market_hash)
      super(market_hash)
    end

    def self.all_objects
      @@all_objects ||= self.all
    end

    # Converts an array to a hash for passing to market instantiation
    def self.convert_to_hash(market_array)
      market_hash = {}
      market_hash[:id] = market_array[0].to_i
      market_hash[:name] = market_array[1]
      market_hash[:address] = market_array[2]
      market_hash[:city] = market_array[3]
      market_hash[:county] = market_array[4]
      market_hash[:state] = market_array[5]
      market_hash[:zip] = market_array[6]
      return market_hash
    end

    # Returns a collection of FarMar::Vendor instances that are associated
    # with the market by the market_id field
    def vendors
      return FarMar::Vendor.by_market(@id)
    end

    # returns a collection of FarMar::Product instances that are associated
    # to the market through the FarMar::Vendor class
    def products
      products = []
      v = vendors
      v.each do |vendor|
        products += vendor.products
      end
      return products
    end

    # returns the vendor with the highest revenue from a market
    def preferred_vendor
      matches = vendors
      if matches.length == 0
        return nil
      elsif matches.length == 1
        return matches[0]
      else
        revenues = matches.map { |v| v.revenue }
        max_index = revenues.each_with_index.max[1]
        return matches[max_index]
      end
    end

  end
end
