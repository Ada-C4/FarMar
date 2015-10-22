module FarMar
  class Market
    attr_accessor :id, :name, :markets_all, :all_vendors
    def initialize(market_hash)
      @id      = market_hash[:id].to_i
      @name    = market_hash[:name]
      @address = market_hash[:address]
      @city    = market_hash[:city]
      @county  = market_hash[:county]
      @state   = market_hash[:state]
      @zip     = market_hash[:zip]
    end

    def self.all(csv = "support/markets.csv")
      # Only reload the CSV if @markets is empty array
      @@markets ||= []
      if @@markets == []
        #binding.pry
        markets_csv = CSV.read(csv)
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
    match_search = []
    markets = FarMar::Market.all("./support/markets.csv")
    vendors = FarMar::Vendor.all("./support/vendors.csv")
    markets.each do |market|
      if market.name.downcase.include? search_term.downcase
        match_search.push(market)
      end
    end
    vendors.each do |vendor|
      if vendor.vendor_name.downcase.include? search_term.downcase
        match_search.push(vendor.market)
      end
    end
    return match_search
  end

  def sorted_vendor
    @all_vendors ||= []
    if @all_vendors == []
      @all_vendors = self.vendors
      #@all_vendors.sort_by! { |vendor| vendor.revenue }
    end
    return @all_vendors
  end
  # Returns the vendor with the highest revenue
  # Can take a date as an input to return the vendor with the highest revenue on a given date
  # date must be provided as year, month, day
  def preferred_vendor(year = nil, month = nil, day = nil)
    vendors = sorted_vendor
    sales_day = []
    if day == nil
      vendors.sort_by! { |vendor| vendor.revenue }
      return @all_vendors[-1]
    else
      start_time = DateTime.new(year,month,day)
      end_time = start_time + 1

      sales = FarMar::Sale.all
      sales.each do |sale|
        if sale.purchase_time.day >= start_time.day && sale.purchase_time.day < end_time.day
          sales_day.push(sale)
        end
      end
      sales_day.sort_by!{ |sale| sale.sale_id }

      market_sales = []
      vendors.each do |vendor|
        sales_day.each do |sale|
          if vendor.vendor_id == sale.vendor_id
            market_sales.push(sale)
          end
        end
      end

      vendor_hash = Hash.new(0)
      market_sales.each do |sale|
        vendor_hash[sale.vendor_id] += sale.amount
      end
      sorted = vendor_hash.sort_by { |vendor, rev| rev}
      return FarMar::Vendor.find(sorted[-1][0])
    end
  end

  # Returns the vendor with the lowest revenue
  # Can take a date as an input to return the vendor with the lowest revenue on a given date
  def worst_vendor(year = nil, month = nil, day = nil)
    vendors = sorted_vendor
    sales_day = []
    if day == nil
      vendors.sort_by! { |vendor| vendor.revenue }
      return @all_vendors[0]
    else
      start_time = DateTime.new(year,month,day)
      end_time = start_time + 1

      sales = FarMar::Sale.all
      sales.each do |sale|
        if sale.purchase_time.day >= start_time.day && sale.purchase_time.day < end_time.day
          sales_day.push(sale)
        end
      end
      sales_day.sort_by!{ |sale| sale.sale_id }

      market_sales = []
      #vendor_sales = []

      vendors.each do |vendor|
        vendor_sales = []
        sales_day.each do |sale|
          #vendor_sales = []
          if vendor.vendor_id == sale.vendor_id
            vendor_sales.push(sale)
          end
        end
        if vendor_sales == []
          vendor_sales.push("NoSales:#{vendor.vendor_id}")
        end
        market_sales.push(vendor_sales)
      end

      market_sales.flatten!


      vendor_hash = Hash.new(0)
      market_sales.each do |sale|
        if sale.class != FarMar::Sale
          sale = sale.split(':')[1]
          #binding.pry
          return FarMar::Vendor.find(sale.to_i)

        else
          vendor_hash[sale.vendor_id] += sale.amount
        end
      end
      sorted = vendor_hash.sort_by { |vendor, rev| rev}
      return FarMar::Vendor.find(sorted[0][0])
    end


  end
  end
end
