require "pry"
module FarMar

  class Market
    attr_accessor :id, :name, :address, :city, :county, :state, :zip
    def initialize(market_hash)
      @id = market_hash[:id].to_i
      @name = market_hash[:name]
      @address = market_hash[:address]
      @city = market_hash[:city]
      @county = market_hash[:county]
      @state = market_hash[:state]
      @zip = market_hash[:zip]
    end

    #MARKET_DATA = CSV.read("support/markets.csv")

    def self.all
      @@markets_all ||= []
      if @@markets_all == []
        CSV.read("support/markets.csv").each do |id, name, address, city, county, state, zip|
          #binding.pry
          market_hash = {:id => id.to_i, :name => name, :address => address, :city => city, :county => county, :state => state, :zip => zip}
          market = FarMar::Market.new(market_hash)
          @@markets_all.push(market)
        end
      end
      return @@markets_all
    end

    def self.find(id)
      Market.all.find do |market|
        id == market.id
      end
    end

    def list_vendors
      vendor_list = []
      FarMar::Vendor.all.each do |vendor|
        if id == vendor.market_id
          vendor_list.push(vendor)
        end
      end
      vendor_list
    end

    def products
      vendors = FarMar::Vendor.by_market(id)
      products = []
      vendors.each do |vendor|
        goods = vendor.list_products
        products.push(goods)
      end
      products
    end
  end
end
