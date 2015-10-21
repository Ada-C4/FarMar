module FarMar
  class Market
    attr_reader :id

    def initialize(market_info)
      @id = market_info[0].to_i
      @name = market_info[1]
      @address = market_info[2]
      @city = market_info[3]
      @county = market_info[4]
      @state = market_info[5]
      @zip = market_info[6]
    end


    def self.all
      @@market_array ||=  []

      if @@market_array == []
        CSV.read("./support/markets.csv").each do |market|
          new_market = FarMar::Market.new(market)
          @@market_array.push(new_market)
        end
      end
      
      return @@market_array
    end


    def self.find(id)
      FarMar::Market.all.find do |market|
        market.id == id
      end
    end

    def vendors
      vendors = FarMar::Vendor.all.find_all do |vendor|
        vendor.market_id == self.id
      end
      return vendors
    end

  end
end
