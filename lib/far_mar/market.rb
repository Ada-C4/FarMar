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

#Creates a class variable to store csv values in order to save time reading while running the program multiple times. Method reads CSV file and uses .map to create a .new object for each line, returning the whole array of objects
    def self.all
      if @market_array.nil?|| @market_array.empty?
        @market_array = CSV.read("support/markets.csv").map do |line|
        Market.new(
        id: line[0],
        name: line[1],
        address: line[2],
        city: line[3],
        county: line[4],
        state: line[5],
        zip: line[6])
        end
      end
      return @market_array
    end

#Find converts the csv file to an array, then uses .find to locate where the first value of each array in each line is equal to the id passed through as the argument. It then initializes an object with the values of the array on that idenitfied line.
    def self.find(id)
      market_array = CSV.read("support/markets.csv")
      matched_line = market_array.find do |line|
        line[0].to_i == id
      end
      return specific_market = Market.new(
        id: matched_line[0],
        name: matched_line[1],
        address: matched_line[2],
        city: matched_line[3],
        county: matched_line[4],
        state: matched_line[5],
        zip: matched_line[6])
    end

#Calls the .all method of Vendors and parses through each vendor (already instantiated via the all method), finding all vendors where the id of the market matches the market id of the vendor.
    def vendors
      possibilities = FarMar::Vendor.all
      associated_vendors = possibilities.find_all do |each|
        @id == each.market_id
      end
      return associated_vendors
    end

#Creates an array of all_products, then calls the vendor method on itself to return all the associated vendors. For each vendor, it calls the vendor product method which finds all the products sold by the vendor. For each product it checks if that product is already included on all_products. If it is not, it pushes the product to the mass array. The method return all_products, consisting of every product of every vendor at the market, with no duplicates.
    def products
      all_products = []
      self.vendors.each do |vendor|
        vendor.products.each do |product|
          all_products.push(product) if !all_products.include?(product)
        end
      end
      return all_products
    end

#This creates an array of results, then goes through all the names of all the markets and vendors. If the name of either of those instances matches the search term (using regexp and /i for case insensitivity), if will push that instance to the results and return it.
    def self.search(search_term)
      results = []
      FarMar::Market.all.find_all do |market|
        results.push(market) if market.name.match(/#{search_term}/i)
      end
      FarMar::Vendor.all.find_all do |vendor|
        results.push(vendor.market) if vendor.name.match(/#{search_term}/i)
      end
      return results
    end

#This calls the vendor method on itself, returning all vendors associated with the market. Then it sorts the vendors least to greatest by their revenue, a method in the vendor class. Finally, the method returns the last vendor of that group, or the vendor with the greatest revenue.
    def pref_vendor
      return self.vendors.sort_by { |vendor| vendor.revenue}.last
    end

#This method starts be going through each vendor of the market. For each vendor, it calls sales, which returns all sales associated with the vendor. Next, for every sale it checks if the purchase_time is equal to the date passed through as an argument. If it is, it calls amount on that sale and adds it to the variable revenue. After the loops cycling through adding the sales of each vendor on a certain date, the method compares to see if the revenue on that date calculated is greater than the max_revenue, which startes at 0. If it is, it sets itself as max revenue and the vendor in question as the max_vendor. Thus, for each vendor it compares their revenue with the max revenue and max vendor of all the vendors the loops has already iterated, returning the overall max_vendor.
    def preferred_vendor(date)
      self.vendors.each do |vendor|
      rev = 0
      max_rev = 0
      max_vendor = nil
       vendor.sales.each do |sale|
         if sale.purchase_time.to_date == date
           rev += sale.amount
         end
       end
        if rev > max_rev
          rev = max_rev
          max_vendor = vendor
        end
      end
      return max_vendor
    end
  end
end
