
module FarMar
  class Market

    attr_reader :market_id, :name, :address, :city, :county, :state, :zip

    def initialize(market_id, name, address, city, county, state, zip)
      @market_id = market_id
      @name = name
      @address = address
      @city = city
      @county = county
      @state = state
      @zip = zip
    end

    def self.all
      @@market_instances ||= []
      if @@market_instances == []
        markets_csv = CSV.read("./support/markets.csv")
        markets_csv.each do |row|
          @@market_instances.push(Market.new(row[0].to_i, row[1], row[2], row[3], row[4], row[5], row[6]))
        end
      end
      return @@market_instances
    end
    def self.find(id)
        self.all.find do |market|
        market.market_id == id
      end
    end
    def vendors
      market_vendor_array = []
      vendor_array = FarMar::Vendor.all
      vendor_array.each do |vendor|
        if vendor.market_id == @market_id
          market_vendor_array.push(vendor)
        end
      end
      return market_vendor_array
    end
    def products
      market_products = []
      vendor_array = self.vendors
      vendor_array.each do |vendor|
        market_products += vendor.products
      end
      return market_products
    end
    def self.search(search_term)
      search_term = search_term.downcase
      name_array = []
      name_search = FarMar::Market.all.map do |market|
        {market.name.downcase => market}
      end
      name_search2 = FarMar::Vendor.all.map do |vendor|
        {vendor.name.downcase => FarMar::Market.find(vendor.market_id)}
      end
      (name_search + name_search2).each do |hash|
        if hash.keys[0].include?(search_term)
          name_array += hash.values
        end
      end
      return name_array.uniq
    end

    def preferred_vendor(date = nil)
      market_vendors = self.vendors
        top_vendor = market_vendors.max_by do |vendor|
          vendor.revenue(date)
        end
        return top_vendor
    end
  end
end
