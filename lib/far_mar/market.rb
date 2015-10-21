module FarMar
  class Market < FarMar_Base
    attr_reader :id, :name, :address, :city, :county, :state, :zip
    FILENAME = './support/markets.csv'

    def initialize(market_hash)
      super(market_hash)
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
      return market_hash
    end

    def self.all
      @@all_objects ||= super
      return @@all_objects
    end

    def vendors
      return FarMar::Vendor.by_market(@id)
    end

  end
end
