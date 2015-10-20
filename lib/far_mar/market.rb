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

    def vendors
      vendors_list = FarMar::Vendor.all

      market_vendors = vendors_list.find_all do |instance|
        @id == instance.market_id
      end

      return market_vendors
    end

    def self.all
      markets_list = []
      markets_csv = CSV.read("./support/markets.csv")

      markets_csv.each do |row|
        market = FarMar::Market.new(row[0], row[1], row[2], row[3], row[4], row[5], row[6])
        markets_list.push(market)
      end

      return markets_list
    end

    def self.find(id)
      markets_list = self.all

      markets_list.find do |instance|
        instance.id == id
      end
    end
  end
end
