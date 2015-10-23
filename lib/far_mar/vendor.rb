module FarMar
  class Vendor
    attr_accessor :id, :name, :employee_no, :market_id
    def initialize(vendor_hash)
      @id = vendor_hash[:id].to_i
      @name = vendor_hash[:name]
      @employee_no = vendor_hash[:employee_no].to_i
      @market_id = vendor_hash[:market_id].to_i
    end

#Creates a class variable to store csv values in order to save time reading while running the program multiple times. Method reads CSV file and uses .map to create a .new object for each line, returning the whole array of objects
    def self.all
      if @vendor_array.nil? || @vendor_array.empty?
        @vendor_array = CSV.read("support/vendors.csv").map do |line|
          Vendor.new(
           id: line[0],
           name: line[1],
           employee_no: line[2],
           market_id: line[3])
        end
      end
        return @vendor_array
    end

#Goes through every line of the CSV file and compares the first value [0], the id, to the argument passed through the method, creating a new object with the data where those two valued are equivalent.
    def self.find(id)
      vendor_array = CSV.read("support/vendors.csv")
      matched_line = vendor_array.find do |line|
        line[0].to_i == id
      end
      return specific_vendor = Vendor.new(
        id: matched_line[0],
        name: matched_line[1],
        employee_no: matched_line[2],
        market_id: matched_line[3])
    end

#Uses the Market find method passing the argument of the vendor's market id, which is in fact the id of the market.
    def market
      return FarMar::Market.find(@market_id)
    end

#Creates an array of all the products, then uses find all to identify when the id of the vendor matches the vendor id of the product. Returns an array of all such matches
    def products
      possibilities = FarMar::Product.all
      associated_products = possibilities.find_all do |each|
        @id == each.vendor_id
      end
      return associated_products
    end

#Creates an array of all sales, then uses find all to identify when the id of the vendor matches the vendor id of the sale. Returns an array of all such matches.
    def sales
      possibilities = FarMar::Sale.all
      associated_sales = possibilities.find_all do |each|
        @id == each.vendor_id
      end
      return associated_sales
    end

#Calls sales on the particular vendor, which returns an array of all sales the vendor has made. For each sale, it iterates through and adds the amount of that sale to the revenue variable. Then it returns the total revenue, or sum of every sale.
    def revenue
      revenue = 0
      self.sales.each do |sale|
        revenue += sale.amount.to_i
      end
      return revenue
    end

#Starts with an array of all vendors using the .all method, then employs find_all to find where the market id passes as an argument equals the market id of each vendor of every iteration. It returns an array of vendors of all of these matches.
    def self.by_market(market_id)
      return self.all.find_all do |each|
        market_id == each.market_id
      end
    end
  end
end
