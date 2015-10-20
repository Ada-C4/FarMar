module FarMar
  class Product
    attr_accessor :id, :name, :vendor_id
    def initialize(product_hash)
      @id = product_hash[:id]
      @name = product_hash[:name]
      @vendor_id = product_hash[:vendor_id]
    end

    def self.all
      products = []
      product_array = CSV.read("support/products.csv")
      product_array.each do |line|
      new_product = Product.new(
        id: product_array[0],
        name: product_array[1],
        product_id: product_array[2])
        products.push(new_product)
      end
    end

    def self.find(id)
      product_array = CSV.read("support/products.csv")
      matched_line = product_array.find do |line|
        line[0].to_i == id
      end
      specific_product = Product.new(
        id: matched_line[0],
        name: matched_line[1],
        product_id: matched_line[2])
    end
  end
end
