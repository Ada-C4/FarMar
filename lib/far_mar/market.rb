module FarMar
  class Market
    attr_reader :id, :name

    def initialize(market_info)
      @id = market_info[0].to_i
      @name = market_info[1]
      @address = market_info[2]
      @city = market_info[3]
      @county = market_info[4]
      @state = market_info[5]
      @zip = market_info[6]
    end

    def self.all
      @@market_array ||=  []

      if @@market_array == []
        CSV.read("./support/markets.csv").each do |market|
          new_market = FarMar::Market.new(market)
          @@market_array.push(new_market)
        end
      end

      return @@market_array
    end

    def self.find(id)
      FarMar::Market.all.find do |market|
        market.id == id
      end
    end

    def vendors
      vendors = FarMar::Vendor.all.find_all do |vendor|
        vendor.market_id == self.id
      end
      return vendors
    end

    def products
      products = []
      vendors = self.vendors
      vendors.each do |vendor|
        vendor_products = vendor.products
        vendor_products.each do |vendor_product|
          products.push(vendor_product)
        end
      end
      return products
    end

    def self.search(search_term)
      results = []
      name_matches = FarMar::Market.all.find_all do |market|
        market.name.downcase.include?(search_term.downcase)
      end
      name_matches.each { |match| results.push(match)}
      vendor_matches = FarMar::Vendor.all.find_all do |vendor|
        vendor.name.downcase.include?(search_term.downcase)
      end
      vendor_matches.each { |match| results.push(match)}
      return results
    end

    def preferred_vendor
      vendors = self.vendors
      best_vendor = vendors.max_by do |vendor|
        vendor.revenue
      end
      return best_vendor
    end

    def preferred_vendor_by_date(date)
      # expecting a string in the form yyyy-mm-dd
      date = Date.parse(date.to_s)

      vendors = self.vendors
      vendor_hash = {}
      vendors.each do |vendor|
        vendor_sales = vendor.sales
        day_sales = vendor_sales.find_all do |sale|
          date == sale.purchase_time.to_date
        end
        day_revenue = 0
        day_sales.each do |sale|
          day_revenue = day_revenue + sale.amount
        end
        vendor_hash[vendor.id] = day_revenue
      end
      best_vendor_id = vendor_hash.key(vendor_hash.values.max)
      return FarMar::Vendor.find(best_vendor_id)
    end

    def worst_vendor
      vendors = self.vendors
      worst_vendor = vendors.min_by do |vendor|
        vendor.revenue
      end
      return worst_vendor
    end

    def worst_vendor_by_date(date)
      # expecting a string in the form yyyy-mm-dd
      date = Date.parse(date.to_s)

      vendors = self.vendors
      vendor_hash = {}
      vendors.each do |vendor|
        vendor_sales = vendor.sales
        day_sales = vendor_sales.find_all do |sale|
          date == sale.purchase_time.to_date
        end
        day_revenue = 0
        day_sales.each do |sale|
          day_revenue = day_revenue + sale.amount
        end
        vendor_hash[vendor.id] = day_revenue
      end
      worst_vendor_id = vendor_hash.key(vendor_hash.values.min)
      return FarMar::Vendor.find(worst_vendor_id)
    end

  end
end
