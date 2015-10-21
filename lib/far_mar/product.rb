module FarMar
  class Product < FarMar_Base
    attr_reader :id, :name, :vendor_id
    FILENAME = './support/products.csv'
    @@all_objects = []

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

    # returns all of the products with the given vendor_id
    def self.by_vendor(product_id)
      csv_file = CSV.read(FILENAME)
      matches = csv_file.find_all { |row| row[2].to_i == product_id }
      products = []
      matches.each do |product_array|
        product_hash = convert_to_hash(product_array)
        products.push(FarMar::Product.new(product_hash))
      end
      return products
    end

    def sales
      return FarMar::Sale.by_product(@id)
    end
  end
end
