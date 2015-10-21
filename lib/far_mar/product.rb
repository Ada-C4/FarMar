module FarMar
  class Product < FarMar_Base
    attr_reader :id, :name, :vendor_id
    FILENAME = './support/products.csv'

    def initialize(product_hash)
      super(product_hash)
    end

    def self.all_objects
      @@all_objects ||= self.all
    end

    # Converts an array to a hash for passing to product instantiation
    def self.convert_to_hash(product_array)
      product_hash = {}
      product_hash[:id] = product_array[0].to_i
      product_hash[:name] = product_array[1]
      product_hash[:vendor_id] = product_array[2].to_i
      return product_hash
    end

    # returns all of the products with the given vendor_id
    def self.by_vendor(vendor_id)
      FarMar::Product.all_objects.find_all { |product| product.vendor_id == vendor_id }
    end

    # returns the FarMar::Vendor instance that is associated with this
    # vendor using the vendor_id field
    def vendor
      return FarMar::Vendor.find(@vendor_id)
    end

    # returns a collection of FarMar::Sale instances that are associated using
    # the product_id field
    def sales
      return FarMar::Sale.by_product(@id)
    end

    # returns the number of times the product has been sold
    def number_of_sales

    end
  end
end
