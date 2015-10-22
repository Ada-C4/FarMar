require "csv"

module FarMar
  class Market

    attr_accessor :id, :name, :address, :city, :county, :state, :zip

    def initialize(id, name, address, city, county, state, zip)
      @id = id.to_i
      @name = name
      @address = address
      @city = city
      @county = county
      @state = state
      @zip = zip
    end

    def self.all
      # Returns an array of Market instances representing all of the markets
      # Not sure I fully understand how this method works.
      csv_info = CSV.read("./support/markets.csv")
      @markets = []
      csv_info.each do |line|
        @markets.push(Market.new(line[0], line[1], line[2], line[3], line[4], line[5], line[6]))
      end
      return @markets
    end

    def self.find(market_id)
      # Returns an instance of Market where the value of the id in the csv
      # matches the passed parameter.
      all.each do |market|
        if market.id == market_id
          return market # the instance of the market.
        end
      end
    end

    def vendors
      # Given a market ID, RETURN vendors associated with that market.
      vendor_array = []
      FarMar::Vendor.all.find_all do |v|
        if v.market_id == id
          vendor_array.push(v)
        end
      end
      return vendor_array
    end


  end
end
