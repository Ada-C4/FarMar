module FarMar
  class Product
    attr_accessor :id, :name, :vendor_id
    def initialize(product_hash)
      @id = product_hash[:id].to_i
      @name = product_hash[:name]
      @vendor_id = product_hash[:vendor_id].to_i
    end

#Creates a class variable to store csv values in order to save time reading while running the program multiple times. Method reads CSV file and uses .map to create a .new object for each line, returning the whole array of objects
    def self.all
      if @product_array.nil? || @product_array.empty?
        @product_array = CSV.read("support/products.csv").map do |line|
          Product.new(
            id: line[0],
            name: line[1],
            vendor_id: line[2])
        end
      end
      return @product_array
    end

#Find converts the csv file to an array, then uses .find to locate where the first value of each array in each line is equal to the id passed through as the argument. It then initializes an object with the values of the array on that idenitfied line.
    def self.find(id)
      product_array = CSV.read("support/products.csv")
      matched_line = product_array.find do |line|
        line[0].to_i == id
      end
      return specific_product = Product.new(
        id: matched_line[0],
        name: matched_line[1],
        vendor_id: matched_line[2])
    end

#Passes the vendor_id of the product to the vendor find method in order to return the vendor that sells this product.
    def vendor
      return FarMar::Vendor.find(@vendor_id)
    end

#Creates an array of all the sales in order to find every sale in which the id of the product matches the product id of the sale. Returns an array of all of those matches.
    def sales
      all_sales = FarMar::Sale.all.find_all do |each|
        @id == each.product_id
      end
      return all_sales
    end

#Calls the sales method and calculates the length of that array, or how many sales are associated with this product.
    def number_of_sales
      self.sales.length
    end

#Goes through an array of all the products to find where the vendor id of the product is equal to the vendor_id passed through as a parameter.
    def self.by_vendor(vendor_id)
      return FarMar::Product.all.find_all do |each|
        vendor_id == each.vendor_id
      end
    end
  end
end
