module FarMar
  class Product
    attr_reader :id, :vendor_id

    def initialize(product_info)
      @id = product_info[0].to_i
      @name = product_info[1]
      @vendor_id = product_info[2].to_i
    end

    def self.all
      product_array = []
      CSV.read("./support/products.csv").each do |product|
        new_product = FarMar::Product.new(product)
        product_array.push(new_product)
      end
      return product_array
    end

  end
end
