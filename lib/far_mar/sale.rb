module FarMar
  class Sale
    attr_accessor :id, :amount, :purchase_time, :vendor_id, :product_id
    def initialize(sale_hash)
      @id = sale_hash[:id].to_i
      @amount = sale_hash[:amount].to_i
      @purchase_time = DateTime.parse(sale_hash[:purchase_time])
      @vendor_id = sale_hash[:vendor_id].to_i
      @product_id = sale_hash[:product_id].to_i
    end

#Creates a class variable to store csv values in order to save time reading while running the program multiple times. Method reads CSV file and uses .map to create a .new object for each line, returning the whole array of objects
    def self.all
      if @sales_array.nil? || @sales_array.empty?
        @sales_array = CSV.read("support/sales.csv").map do |line|
        Sale.new(
        id: line[0],
        amount: line[1],
        purchase_time: line[2],
        vendor_id: line[3],
        product_id: line[4])
        end
      end
      return @sales_array
    end

#Find converts the csv file to an array, then uses .find to locate where the first value of each array in each line is equal to the id passed through as the argument. It then initializes an object with the values of the array on that idenitfied line.
    def self.find(id)
      sales_array = CSV.read("support/sales.csv")
      matched_line = sales_array.find do |line|
        line[0].to_i == id
      end
        return Sale.new(
        id: matched_line[0],
        amount: matched_line[1],
        purchase_time: matched_line[2],
        vendor_id: matched_line[3],
        product_id: matched_line[4])
    end

    def vendor
      return FarMar::Vendor.find(@vendor_id)

    end

    def product
      return FarMar::Product.find(@product_id)
    end

    def self.between(beginning_time, end_time)
      beginning_time = DateTime.parse(beginning_time) if beginning_time.class == String
      end_time = DateTime.parse(end_time) if end_time.class == String
      print beginning_time
      print end_time
      self.all.find_all do |each|
       each.purchase_time >= beginning_time && each.purchase_time <= end_time
      end
    end
  end
end
