require 'pry'

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

    def self.all
      markets = []
      market_array = CSV.read("support/markets.csv")
      market_array.each do |line|
      new_market = Market.new(
        id: line[0],
        name: line[1],
        address: line[2],
        city: line[3],
        county: line[4],
        state: line[5],
        zip: line[6])
        markets.push(new_market)
      end
      return markets
    end

    def self.find(id)
      market_array = CSV.read("support/markets.csv")
      matched_line = market_array.find do |line|
        line[0].to_i == id
      end
      specific_market = Market.new(
        id: matched_line[0],
        name: matched_line[1],
        address: matched_line[2],
        city: matched_line[3],
        county: matched_line[4],
        state: matched_line[5],
        zip: matched_line[6])
    end

    def vendors
      possibilities = FarMar::Vendor.all
      associated_vendors = possibilities.find_all do |each|
        @id == each.market_id
      end
      return associated_vendors
    end

    def products
      all_products = []
      self.vendors.each do |each|
        all_products.push(each.products)
      end
      return all_products
    end

    def self.search(search_term)
      FarMar::Market.all.find_all do |each|
        if include?(search_term)
        end
      end
    end

    def preferred_vendor
      self.vendors.sort_by { |vendor| vendor.revenue}.last
    end

    def preferred_vendor(date)
      self.vendors.sort_by { |vendor| vendor.revenue}.last

    end
  end
end
