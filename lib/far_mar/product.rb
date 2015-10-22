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

    # Returns an instance of product where the value of the id in the csv
    # matches the passed parameter.
    def self.find(product_id)
      all.each do |product|
        if product.id == product_id
          return product # the instance of the vendor.
        end
      end
    end

    # Returns the instance of the Vendor by the product vendor_id.
    def vendor
      FarMar::Vendor.all.each do |vend|
        if vend.id == vendor_id
          return vend
        end
      end
    end

    # Returns array of sales where the product_id equals the Product ID
    def sales
      sales_array = []
      FarMar::Sale.all.find_all do |sales|
        if sales.product_id == id
          sales_array.push(sales)
        end
      end
    end

    # Returns the number of times this product has been sold.
    def number_of_sales
      count = 0
      FarMar::Sale.all.each do |s|
        if s.product_id == id
            count += 1
        end
      end
      return count
    end

    # Returns all of the products matching the vendor_id
    def self.by_vendor(vend_id)
    end





  end
end
