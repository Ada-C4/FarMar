module FarMar
  class Market

    attr_reader :market_id, :name, :address, :city, :county, :state, :zip

    def initialize(market_id, name, address, city, county, state, zip)
      @market_id = market_id
      @name = name
      @address = address
      @city = city
      @county = county
      @state = state
      @zip = zip
    end

    def self.all
      markets_csv = CSV.read("./support/markets.csv")
      market_instances = []
      markets_csv.each do |row|
        market_instances.push(Market.new(row[0].to_i, row[1], row[2], row[3], row[4], row[5], row[6]))
      end
      return market_instances
    end
    def self.find(id)
        self.all.find do |market|
        market.market_id == id
      end
    end
    def vendors
      market_vendor_array = []
      vendor_array = FarMar::Vendor.all
      vendor_array.each do |vendor|
        if vendor.market_id == @market_id
          market_vendor_array.push(vendor)
        end
      end
      return market_vendor_array
    end
    def products
      market_products = []
      vendor_array = self.vendors
      vendor_array.each do |vendor|
        market_products += vendor.products
      end
      return market_products
    end
  end
end
