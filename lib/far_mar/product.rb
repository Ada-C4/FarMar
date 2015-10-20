CSV.read("./support/products.csv")

module FarMar
  class Product
    attr_reader :id, :name, :vendor_id

    def initialize(id, name, vendor_id)
      @id = id
      @name = name
      @vendor_id = vendor_id
    end

    def self.all
      all_products = []

      CSV.read("./support/products.csv").each do |line|
        y = FarMar::Product.new(line[0].to_i, line[1], line[2].to_i)
        all_products.push(y)
      end

      return all_products
    end

    def self.find(id)
      FarMar::Product.all.find do |product_instance|
        product_instance.id == id
      end
    end
  end
end
