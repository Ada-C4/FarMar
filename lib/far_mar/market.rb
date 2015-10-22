module FarMar
  class Market
    attr_reader :id, :name, :address, :city, :county, :state, :zip

    def initialize(id, name, address, city, county, state, zip)
      @id = id
      @name = name
      @address = address
      @city = city
      @county = county
      @state = state
      @zip = zip
    end

    def self.all
      if @all_markets.nil? || @all_markets.empty?
        @all_markets = CSV.read("support/markets.csv").map do |line|
          FarMar::Market.new(line[0].to_i, line[1], line[2], line[3], line[4], line[5], line[6])
        end
      end
      return @all_markets
    end

    def self.find(id)
      match = CSV.open("support/markets.csv").find { |n| n[0].to_i == id}
      return FarMar::Market.new(match[0].to_i, match[1], match[2], match[3], match[4], match[5], match[6])
    end

    #Returns a collection of Vendors associated with the market's id
    def vendors
      return FarMar::Vendor.all.find_all {|vendor| vendor.market_id == @id}
    end

    #returns all products sold at the specific market
    def products
      all_products = []
      vendors.each do |vendor|
        vendor.products.each do |product|
          all_products << product
        end
      end
      return all_products
    end

    def self.search(search_term)
      markets = []
      FarMar::Vendor.all.find_all do |vendor|
        markets.push(vendor.market) if vendor.name.match(/#{search_term}/i)
      end
      FarMar::Market.all.find_all do |market|
        markets.push(market) if market.name.match(/#{search_term}/i)
      end
      return markets
    end

    def preferred_vendor
      return vendors.max_by {|vendor| vendor.revenue}
    end

    def preferred_vendor_date(date)
      return vendors.max_by {|vendor| vendor.revenue_date(date)}
    end

    def worst_vendor
      return vendors.min_by {|vendor| vendor.revenue}
    end

    def worst_vendor_date(date)
      return vendors.min_by {|vendor| vendor.revenue_date(date)}
    end
  end
end
