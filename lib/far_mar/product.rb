module FarMar
  class Product < FarMar_Base
    attr_reader :id, :name, :vendor_id

    def initialize(product_hash)
      super(product_hash)
    end

    # Converts an array to a hash for passing to product instantiation
    def self.convert_to_hash(product_array)
      product_hash = {}
      product_hash[:id] = product_array[0].to_i
      product_hash[:name] = product_array[1]
      product_hash[:vendor_id] = product_array[2].to_i
      return product_hash
    end

    def self.all
      super('./support/products.csv')
    end
  end
end
