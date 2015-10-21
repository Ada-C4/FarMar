module FarMar

  class Market

    attr_reader :id, :name, :address, :city, :county, :state, :zip

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
      @@markets_all ||= []

      if @@markets_all == []

        markets_array = CSV.read("./support/markets.csv")

        markets_array.map! do |market|
          FarMar::Market.new(market[0],market[1],market[2], market[3], market[4], market[5], market[6])
        end
        @@markets_all = markets_array
      end
      return @@markets_all
    end

    def self.find(id)
      FarMar::Market.all.find do |market|
        market.id == id
      end
    end

    def vendors
      vendors = FarMar::Vendor.all.find_all do |vendor|
        vendor.market_id == @id
      end
    return vendors
    end

  end
end
