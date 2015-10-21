module FarMar
  class Market
    attr_accessor :id, :name, :markets_all
    def initialize(market_hash)
      @id      = market_hash[:id].to_i
      @name    = market_hash[:name]
      @address = market_hash[:address]
      @city    = market_hash[:city]
      @county  = market_hash[:county]
      @state   = market_hash[:state]
      @zip     = market_hash[:zip]
    end

    def self.all
      # Only reload the CSV if @markets is empty array
      @@markets ||= []
      if @@markets == []
        #binding.pry
        markets_csv = CSV.read("support/markets.csv")
        markets_csv.each do |id, name, address, city, county, state, zip|
          hash = {:id => id, :name => name, :address => address, :city => city, :county => county, :state => state, :zip => zip}
          market = FarMar::Market.new(hash)
          @@markets.push(market)
        end
      end
      return @@markets
    end

    def self.find(id)
      @@markets.find do |market|
        market.id == id
      end
    end

    def vendors
      vendors = FarMar::Vendor.all
      matched_vendors = vendors.find_all do |vendor|
        vendor.market_id == self.id
      end
      return matched_vendors
    end

  # ----------- OPTIONAL REQUIREMENTS: Part I --------------------- #

  # Returns a collection of product instances that are associated to the market though the FarMar::Vendor class
  def products
    products = []
    matched_vendors = self.vendors
    matched_vendors.each { |vendor| products.push(vendor.products)}
    products.flatten!
    return products
  end

  # Returns a collection of Market instances where the market name or vendor name contain the search term
  def self.search(search_term)
  end

  # Returns the vendor with the highest revenue
  def preferred_vendor
  end

  # Returns the vendor with highest revenue for the given date
  def preferred_vendor(date)
  end

  # Returns the vendor with the lowest revenue
  def worst_vendor
  end

  # Returns the vendor with the lowest revenue for the given date
  def worst_vendor(date)
  end


  end
end
