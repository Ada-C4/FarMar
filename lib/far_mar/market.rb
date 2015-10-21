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
      market_array = CSV.read("./support/markets.csv")

      market_array.map! do |market|
        FarMar::Market.new(market[0],market[1],market[2], market[3], market[4], market[5], market[6])
      end
        return market_array
    end

    def self.find(id)
      FarMar::Market.all.find do |market|
        market.id == id
      end
    end

  end
end
