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
      vendors_list = Vendor.all

      return vendors_list.find_all do |instance|
        @id == instance.market_id
      end
    end

    def products
      market_products = []
      vendors_list = self.vendors

      vendors_list.each do |vendor|
        market_products += vendor.products
      end

      return market_products
    end

    def self.all
      @@markets_list ||= []

      if @@markets_list == []
        CSV.foreach("./support/markets.csv") do |row|
          market = Market.new(row[0], row[1], row[2], row[3], row[4], row[5], row[6])
          @@markets_list.push(market)
        end
      end

      return @@markets_list
    end

    def self.find(id)
      markets_list = self.all

      markets_list.find do |instance|
        instance.id == id
      end
    end
  end
end
