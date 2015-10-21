module FarMar
  class Market
    attr_reader :id, :name, :address, :city, :county, :state, :zip

    def initialize(market_hash)
      @id = market_hash[:id].to_i
      @name = market_hash[:name]
      @address = market_hash[:address]
      @city = market_hash[:city]
      @county = market_hash[:county]
      @state = market_hash[:state]
      @zip = market_hash[:zip]
    end


    def self.all
      # if @@market_array is nil, reads the csv and creates the array
      # otherwise uses array already in memory
      @@markets_array ||= CSV.read('./support/markets.csv').map do |col|
        FarMar::Market.new({
          id: col[0],
          name: col[1],
          address: col[2],
          city: col[3],
          county: col[4],
          state: col[5],
          zip: col[6]
        })
      end
    end

    def self.find(id)
      all.find do |market|
        market.id == id
      end
    end

    # def vendors
    #  returns a collection of FarMar::Vendor instances
    #  that are associated with the market by the market_id field.
    # end
  end
end
