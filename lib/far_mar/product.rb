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
      csv_file = CSV.read("./support/products.csv")
      # Create empty array which will hold all the product objects
      products = []
      csv_file.each do |row|
        # Convert the array to a hash
        product_hash = convert_to_hash(row)
        # Create a product object from each row-hash in the csv file
        temp = FarMar::Product.new(product_hash)
        # Push product object to array of products
        products.push(temp)
      end
      return products
    end
  end
end
