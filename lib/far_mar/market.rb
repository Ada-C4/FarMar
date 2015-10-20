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
      CSV.read('./support/markets.csv').each do |col|
        market = FarMar::Market.new(col[0],col[1],col[2],col[3],col[4],col[5],col[6])
        markets_array.push(market)
      end
      return markets_array
    end


    def self.find(id)
    end

    # def vendors
    #  returns a collection of FarMar::Vendor instances
    #  that are associated with the market by the market_id field.
    # end
  end
end
