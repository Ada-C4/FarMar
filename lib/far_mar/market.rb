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

    # Returns a collection of all market instances, representing all the markets described in the CSV
    def self.all(csv = "support/markets.csv")
      # Only reload the CSV if @@markets is an empty array
      @@markets ||= []
      if @@markets == []
        markets_csv = CSV.read(csv)
        # Create a new market object for each row in the CSV
        markets_csv.each do |id, name, address, city, county, state, zip|
          hash = {:id => id, :name => name, :address => address, :city => city, :county => county, :state => state, :zip => zip}
          market = FarMar::Market.new(hash)
          @@markets.push(market)
        end
      end
      # Return array of all market objects
      return @@markets
    end

    # Returns an instance of Market where the value of the ID field matches the passed parameter
    def self.find(id)
      @@markets.find do |market|
        market.id == id
      end
    end

    # Returns a collection of Vendor instances that are associated with the market
    def vendors
      # Generate the vendor list
      vendors = FarMar::Vendor.all
      # Find the vendors with matching market ids
      matched_vendors = vendors.find_all do |vendor|
        vendor.market_id == self.id
      end
      return matched_vendors
    end

  # ----------- OPTIONAL REQUIREMENTS: Part I --------------------- #

  # Returns a collection of product instances that are associated to the market though the FarMar::Vendor class
  def products
    products = []
    # Find the vendors that correlate to the market in question
    matched_vendors = self.vendors
    # For each vendor, pull the product list and add to an array
    matched_vendors.each { |vendor| products.push(vendor.products)}
    products.flatten!
    return products
  end

  # Returns a collection of Market instances where the market name or vendor name contain the search term
  def self.search(search_term)
    # initialize the matches array
    match_search = []
    # Generate all markets and vendors
    markets = FarMar::Market.all("./support/markets.csv")
    vendors = FarMar::Vendor.all("./support/vendors.csv")
    # Check market names for matches. If a match is found, push it to the match_search array
    markets.each do |market|
      if market.name.downcase.include? search_term.downcase
        match_search.push(market)
      end
    end
    # Check vendor names for matches. Push any matches to the array.
    vendors.each do |vendor|
      if vendor.vendor_name.downcase.include? search_term.downcase
        match_search.push(vendor.market)
      end
    end
    return match_search
  end

  # Helper method to simplify preferred_vendor and worst_vendor methods (code is shared between the two)
  # runs self.vendors only if it hasn't already been run
  def matched_vendor
    @all_vendors ||= []
    if @all_vendors == []
      @all_vendors = self.vendors
    end
    return @all_vendors
  end

  # Returns the vendor with the highest revenue (Can also take a date as an input to return the vendor with the highest revenue on a given date)
  # date must be provided as year, month, day
  # default value is nil - if a date is not entered, the function returns the best vendor for all days
  def preferred_vendor(year = nil, month = nil, day = nil)
    vendors = matched_vendor
    sales_day = []
    # If no date is provided, the vendor array is sorted and the vendor with the highest revenue is returned
    if day == nil
      vendors.sort_by! { |vendor| vendor.revenue }
      return @all_vendors[-1]
    # If a date is provided the method will return the vendor with the highest revenue for that date
    else
      # Create a DateTime object with the provided date
      start_time = DateTime.new(year,month,day)
      # end_time is one day later
      end_time = start_time + 1

      # Generate all sales
      sales = FarMar::Sale.all
      # Narrow sales down to only the sales for the day by iterating through sales and checking if the purchase_time falls into the day range (this could be rewritten to use the Sale.between method. It was causing a lot of issues so I just rewrote the function here)
      sales.each do |sale|
        if sale.purchase_time.day >= start_time.day && sale.purchase_time.day < end_time.day
          sales_day.push(sale)
        end
      end

      market_sales = []
      # For each vendor, iterate through the sales for the day and see if the sale is associated with the vendor
      vendors.each do |vendor|
        sales_day.each do |sale|
          if vendor.vendor_id == sale.vendor_id
            market_sales.push(sale)
          end
        end
      end
      # Initizalize a new hash with a default value of 0
      vendor_hash = Hash.new(0)
      # Iterate through each matching sale and set the hash to use the vendor_id as the key and update the value to the sale amount.  If you have multiple sales for a vendor, the purchase_amounts are summed in the value.
      market_sales.each do |sale|
        vendor_hash[sale.vendor_id] += sale.amount
      end
      # Sort the hash in revenue order (by value)
      sorted = vendor_hash.sort_by { |vendor, rev| rev}
      # Return the vendor associated with the key for the last item in sorted
      return FarMar::Vendor.find(sorted[-1][0])
    end
  end

  # Returns the vendor with the lowest revenue
  # Can take a date as an input to return the vendor with the lowest revenue on a given date
  # Works very simialrily to preferred_vendor - comments below detail the differences between the 2. All other functionality should be assumed to be the same.
  def worst_vendor(year = nil, month = nil, day = nil)
    vendors = matched_vendor
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

      vendors.each do |vendor|
        vendor_sales = []
        sales_day.each do |sale|
          if vendor.vendor_id == sale.vendor_id
            vendor_sales.push(sale)
          end
        end
        # Difference from preferred_vendor: Need to accomodate that there may be a vendor without a sale for the day. We need to return this vendor as the worst vendor.
        # If after going through the sales for the day, the vendor_sales array is empty, push a string into the array.
        if vendor_sales == []
          vendor_sales.push("NoSales:#{vendor.vendor_id}")
        end
        market_sales.push(vendor_sales)
      end
      # Flatten creates a single array from an array of arrays
      market_sales.flatten!

      vendor_hash = Hash.new(0)
      market_sales.each do |sale|
        # If an item in the array is not a Sale, we know it is one of the strings we placed earlier (for a no sale situation)
        if sale.class != FarMar::Sale
          # split the string to get just the vendor_id and find the associated vendor object. Return this vendor as the worst vendor
          sale = sale.split(':')[1].to_i
          return FarMar::Vendor.find(sale)
        # Otherwise the behavior is the same as preffered_vendor
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
