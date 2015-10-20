module FarMar
  class Market

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
      markets_array = []
      CSV.open('./support/markets.csv').each do |col|
        market = FarMar::Market.new(col[0],col[1],col[2],col[3],col[4],col[5],col[6])
        markets_array.push(market)
      end
      return markets_array
    end

    def self.find(id)
      match = CSV.open('./support/markets.csv').find do |market|
        market[0].to_i == id
      end
      found = FarMar::Market.new(match[0],match[1],match[2],match[3],match[4],match[5],match[6])
    end

    # def vendors
    #  returns a collection of FarMar::Vendor instances
    #  that are associated with the market by the market_id field.
    # end
  end
end
