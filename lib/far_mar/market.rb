
module FarMar
  class Market

    attr_reader :id, :name

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
      @@all_markets ||= []

      if @@all_markets == []
        CSV.read("./support/markets.csv").each do |line|
          y = FarMar::Market.new(line[0].to_i, line[1], line[2], line[3], line[4], line[5], line[6])
          @@all_markets.push(y)
        end
      end

      return @@all_markets
    end

    def self.find(id)
      FarMar::Market.all.find do |market_instance|
        market_instance.id == id
      end
    end

    def vendors
      FarMar::Vendor.all.find_all do |vendor_instance|
        vendor_instance.market_id == @id
      end
    end

    def products
      # empty array to fill with collection of products
      all_products = []

      # get a collection of all vendors
      all_vendors = vendors

      # to each vendor instance, run the products method to get a list of products,
      # then push all of those proudcts into an array
      all_vendors.each do |vendor_instance|
        all_products.push(vendor_instance.products)
      end

      # need to flatten all products so it doesn't return an array of arrays
      return all_products.flatten!
    end

    def self.search(search_term)
      search_term_instances = []

      markets = FarMar::Market.all

      markets.each do |mkt_instance|
        if mkt_instance.name.match(/#{search_term}/i)
          search_term_instances.push(mkt_instance)
        end

        mkt_vendors = mkt_instance.vendors

        mkt_vendors.each do |vendor_instance|
          if vendor_instance.name.match(/#{search_term}/i)
            search_term_instances.push(mkt_instance)
          end
        end
      end

      return search_term_instances

    end
  end
end
