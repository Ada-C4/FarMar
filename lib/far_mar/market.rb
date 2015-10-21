module FarMar
  class Market
    attr_accessor :id, :name, :markets_all
    def initialize(market_hash)
      @id      = market_hash[:id].to_i
      @name    = market_hash[:name]
      @address = market_hash[:address]
      @city    = market_hash[:city]
      @county  = market_hash[:county]
      @state   = market_hash[:state]
      @zip     = market_hash[:zip]
    end

    def self.all
      @@markets_all ||= []
      if @@markets_all == []
        #binding.pry
        markets_csv = CSV.read("support/markets.csv")
        markets_csv.each do |id, name, address, city, county, state, zip|
          hash = {:id => id, :name => name, :address => address, :city => city, :county => county, :state => state, :zip => zip}
          market = FarMar::Market.new(hash)
          @@markets_all.push(market)
        end
      end
      return @markets = @@markets_all
    end

    def self.find(id)
      @markets.find do |market|
        market.id == id
      end
    end

    def vendors
      vendors = FarMar::Vendor.all
      matched_vendors = vendors.find_all do |vendor|
        vendor.market_id == self.id
      end
      return matched_vendors
    end
  end
end
