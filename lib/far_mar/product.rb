module FarMar

  class Product

    attr_reader :id, :name, :vendor_id

    def initialize(id, name, vendor_id)
      @id = id.to_i
      @name = name
      @vendor_id = vendor_id.to_i
    end

    def self.all
      product_array = CSV.read("./support/products.csv")

      product_array.map! do |product|
        FarMar::Product.new(product[0],product[1],product[2])
      end
        return product_array
    end

  end

end
