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

        markets_array = CSV.read("./support/markets.csv")

        markets_array.map! do |market|
          FarMar::Market.new(market[0],market[1],market[2], market[3], market[4], market[5], market[6])
        end
        @@markets_all = markets_array
      end
      return @@markets_all
    end

    def self.find(id)
      FarMar::Market.all.find do |market|
        market.id == id
      end
    end

    def vendors
      vendors = FarMar::Vendor.all.find_all do |vendor|
        vendor.market_id == @id
      end
    return vendors
    end

    def products
      market_vendors = self.vendors
      market_products = []
      market_vendors.each do |vendor|
        products = vendor.products
        market_products += products
      end
      return market_products
    end

    #returns a collection
    # of FarMar::Market instances where the market name or vendor name contain the search_term
    def self.search(search_term)
      search_term = search_term.downcase
      name_search_results = FarMar::Market.all.find_all do |market|
        market.name.downcase.include?(search_term)
      end
      vendor_search_results = FarMar::Vendor.all.find_all do |vendor|
        vendor.name.downcase.include?(search_term)
      end
      vendor_search_results.map! do |vendor|
        vendor.market
      end
      return name_search_results + vendor_search_results
    end


  end
end
