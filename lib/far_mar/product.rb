require "csv"

module FarMar
  class Product

    attr_accessor :id, :name, :vendor_id

    def initialize(id, name, vendor_id)
      @id = id.to_i
      @name = name
      @vendor_id = vendor_id.to_i
    end

    def self.all
      # returns a collection of product instances
      # representing all of the products described in the CSV
      csv_info = CSV.read("./support/products.csv")
      @products = []
      csv_info.each do |line|
        @products.push(Product.new(line[0], line[1], line[2]))
      end
      return @products
    end

    def self.find(product_id)
      # Returns an instance of product where the value of the id in the csv
      # matches the passed parameter.
      all.each do |product|
        if product.id == product_id
          return product # the instance of the vendor.
        end
      end
    end

    def vendor(vendor_id)
      # Returns the instance of the vendor, given the vendor_id of the product.
    end

    def sales(product_id)
      # Returns array of the sales associated with the product_id
    end

    def number_of_sales
      # Returns the number of times this product has been sold.
    end

    def self.by_vendor(vendor_id)
      # Returns all of the products matching the vendor_id
    end
  end
end
