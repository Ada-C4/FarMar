require './lib/far_mar'
require 'pry'
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
        CSV.read("./support/markets.csv").map do |row|
          @@markets_all.push(FarMar::Market.new(row[0], row[1], row[2], row[3], row[4], row[5], row[6]))
        end
      end
        return @@markets_all
    end
    def self.find(id)
      FarMar::Market.all.find do |market|
        market.id == id
      end
    end
    def vendors
      FarMar::Vendor.all.find_all do |vendor|
        self.id == vendor.market_id
      end
    end
    def products
      products = []
      vendors.map do |vendor|
        vendor.products.map do |product|
          products.push(product)
        end
      end
      return products
    end
    def self.search(search_term)
      search_term = search_term.downcase
      matching_markets = []
      all.each do |market|
        if (market.name.downcase.include? search_term) && !(matching_markets.include? market)
            matching_markets.push(market)
        end
      end
      FarMar::Vendor.all.each do |vendor|
        if (vendor.name.downcase.include? search_term) && !(matching_markets.include? vendor.market)
            matching_markets.push(vendor.market)
        end
      end
      return matching_markets
    end
  end
end
