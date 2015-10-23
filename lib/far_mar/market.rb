
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

    def prefered_vendor
      highest_revenue = 0
      ven_highest_revenue = nil

      vendors.each do |vendor_instance|
        ven_revenue = vendor_instance.revenue
        if ven_revenue > highest_revenue
          highest_revenue = ven_revenue
          ven_highest_revenue = vendor_instance
        end
      end
      return ven_highest_revenue
    end

    def prefered_vendor_on(date)
      date = DateTime.strptime(date, "%Y-%m-%d").to_date
      highest_revenue = 0
      ven_highest_revenue = nil

      vendors.each do |vendor_instance|
        vendor_instance.sales.each do |sales_instance|
          sales_on_date = []
          revenue = 0
          if sales_instance.purchase_time.to_date == date
            sales_on_date.push(sales_instance.amount)
          end
          if sales_on_date.length > 0
            sales_on_date.each {|amount| revenue += amount}
            if revenue > highest_revenue
              highest_revenue = revenue
              ven_highest_revenue = vendor_instance
            end
          end
        end
      end
      return ven_highest_revenue
    end

    def worst_vendor
      lowest_revenue = Float::INFINITY
      ven_lowest_revenue = nil

      vendors.each do |vendor_instance|
        ven_revenue = vendor_instance.revenue
        if ven_revenue < lowest_revenue
          lowest_revenue = ven_revenue
          ven_lowest_revenue = vendor_instance
        end
      end
      return ven_lowest_revenue
    end

    def worst_vendor_on(date)
      date = Date.parse(date)
      lowest_revenue = Float::INFINITY
      ven_lowest_revenue = nil

      vendors.each do |vendor_instance|
        sales_on_date = []
        revenue = 0
        vendor_instance.sales.each do |sales_instance|
          if sales_instance.purchase_time.to_date == date
            sales_on_date.push(sales_instance.amount)
          end
        end
        if sales_on_date.length > 0
          sales_on_date.each {|amount| revenue += amount}
          if revenue < lowest_revenue
            lowest_revenue = revenue
            ven_lowest_revenue = vendor_instance
          end
        end
      end
      return ven_lowest_revenue
    end

  end
end
