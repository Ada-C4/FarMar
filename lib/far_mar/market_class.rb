require "pry"

module FarMar
  class Market

    attr_accessor :id, :name, :address, :city, :county, :state, :zip

  # Each individual market has many vendors associated with it. The `FarMar::Market` data, in order in the CSV, consists of:
  #
  # 1. ID - (Fixnum) a unique identifier for that market
  # 2. Name - (String) the name of the market (not guaranteed unique)
  # 3. Address - (String) street address of the market
  # 4. City - (String) city in which the market is located
  # 5. County - (String) county in which the market is located
  # 6. State - (String) state in which the market is located
  # 7. Zip - (String) zipcode in which the market is located

    def initialize(id, name, address, city, county, state, zip)
      @id = id
      @name = name
      @address = address
      @city = city
      @county = county
      @state = state
      @zip = zip
    end

# - `self.all` - returns a collection of Market instances, representing all of the markets described in the CSV
    def self.all
      market_array = CSV.read("./support/markets.csv")
      all_markets_array = []
        market_array.each do |single_array|
          id = single_array[0]
          name = single_array[1]
          address = single_array[2]
          city = single_array[3]
          county = single_array[4]
          state = single_array[5]
          zip = single_array[6]
        all_markets_array.push(FarMar::Market.new(id, name, address, city, county, state, zip))
        end
      return all_markets_array
    end

# # - `self.find(id)` - returns an instance of Market where the value of the `id` field in the CSV matches the passed parameter.

    def self.find_market(market_id)
      FarMar::Market.all.find do |single_market|
        if single_market.id == market_id.to_s
        return single_market
      end
      end
    end

# - `vendors` - returns a collection of `FarMar::Vendor` instances that are associated with the market by the `market_id` field.

    def vendors
      var = []
      FarMar::Vendor.all.find_all do |seller|
        if seller.market_id == self.id.to_s
          var.push(seller)
        end #close if
      end #close do
      #return array of vendor instances
      return var
    end

  end
end
