module FarMar
  class Product
    attr_accessor :id, :name, :vendor_id
    def initialize(id, name, vendor_id)
      @id = id.to_i
      @name = name
      @vendor_id = vendor_id
    end

    def self.all
      #returns a collection of product instances, representing all of the products described in the CSV
      product_array = []
      product_file = CSV.read("./support/products.csv")
      product_file.each do |product|
        list_of_products = FarMar::Product.new(product[0], product[1], product[2])
        product_array.push(list_of_products)
      end
      return product_array
    end

    def self.find(id)
      #returns an instance of Product where the value in the id field of the CSV file matches the passed parameter
      product_array = self.all
      product_array.find {|i| i.id == id}
    end
  end
end
