module FarMar
  class Product
    attr_accessor :id, :name, :vendor_id
    def initialize(id, name, vendor_id)
      @id = id
      @name = name
      @vendor_id = vendor_id
    end

    def self.all
      #returns a collection of product instances, representing all of the products described in the CSV
      product_array = []
      CSV.read("./support/products.csv").each do |product|
        print product
        list_of_products = Product.new(product[0], product[1], product[2])
        product_array.push(list_of_products)
      end
    end
  end
end
